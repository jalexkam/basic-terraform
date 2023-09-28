terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17"
    }
  }

  backend "s3" {
    key            = "basic-terraform-reset/terraform.tfstate"
    bucket         = "state-bucket-62746"
    dynamodb_table = "state-table-62746"
    encrypt        = true
    region         = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region                   = var.aws_region
  profile                  = var.aws_profile
  shared_credentials_files = ["/home/ec2-user/.aws/credentials"]
}
