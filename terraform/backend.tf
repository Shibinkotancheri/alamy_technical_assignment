terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
  required_version = ">= 1.4"
  backend "s3" {
    bucket         = "TFSTATE_BUCKET_NAME"
    key            = "observability/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "TFSTATE_LOCK_TABLE_NAME"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}