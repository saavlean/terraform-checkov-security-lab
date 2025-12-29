#!/bin/bash

# scripts/scan.sh: Escaneo automatizado con Checkov

checkov -f terraform/main.tf

