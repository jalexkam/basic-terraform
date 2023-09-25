terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17"
    }
  }

  # backend "local" {
  #   path = "./terraformstate.tfstate"
  # }
  backend "s3" {
    key            = "basic-terraform/terraform.tfstate"
    bucket         = "state-bucket-62746"
    dynamodb_table = "state-table-62746"
    encrypt        = true
    region         = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  profile = "alex-meli-card-admincli"
  region  = "us-east-1"
  #access_key = "AKIA5S2A5T5737JB7OPU"
  #secret_key = "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"
}
