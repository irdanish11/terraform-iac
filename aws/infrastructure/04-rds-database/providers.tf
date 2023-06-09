terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.62.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = "eu-west-2"
  profile = "infrafy-tf-admin-dev"
}

# Configuring S3 and DynamoDB backend for Terraform state
# terraform init -reconfigure
terraform {
  backend "s3" {
    bucket         = "infrafy-backend-tfstate-bucket-dev"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    profile        = "infrafy-tf-admin-dev"
    dynamodb_table = "infrafy-tfstate-lock-dev"
  }
}
