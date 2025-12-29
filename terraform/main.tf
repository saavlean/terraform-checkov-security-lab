resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "my-unencrypted-bucket"
  acl    = "public-read"
}

