resource "aws_s3_bucket" "secure_bucket" {
  bucket = "my-secure-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  logging {
    target_bucket = "my-logs-bucket"
    target_prefix = "log/"
  }

  lifecycle_rule {
    enabled = true
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    expiration {
      days = 365
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = "alias/aws/s3"
      }
    }
  }

  replication_configuration {
    role = "arn:aws:iam::123456789012:role/replication-role"
    rules {
      id     = "replication-rule"
      status = "Enabled"

      destination {
        bucket        = "arn:aws:s3:::my-replica-bucket"
        storage_class = "STANDARD"
      }
    }
  }

  tags = {
    Environment = "production"
    Owner       = "Leandro"
  }
}

resource "aws_s3_bucket_public_access_block" "secure_bucket_block" {
  bucket                  = aws_s3_bucket.secure_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_sns_topic" "bucket_notifications" {
  name              = "bucket-notifications"
  kms_master_key_id = "alias/aws/sns"
}

resource "aws_s3_bucket_notification" "secure_bucket_notification" {
  bucket = aws_s3_bucket.secure_bucket.id

  topic {
    topic_arn     = aws_sns_topic.bucket_notifications.arn
    events        = ["s3:ObjectCreated:*"]
    filter_prefix = "logs/"
  }

  depends_on = [aws_s3_bucket.secure_bucket]
}

