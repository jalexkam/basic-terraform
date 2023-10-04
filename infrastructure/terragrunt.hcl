locals { 
 region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
 profile_vars = read_terragrunt_config(find_in_parent_folders("profile.hcl"))
 environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
 
  # Extract the variables we need for easy access
  shared_credentials_files =    local.profile_vars.locals.shared_credentials_files 
  aws_region = local.region_vars.locals.aws_region
  aws_profile = local.profile_vars.locals.aws_profile

  remote_state_bucket_name =  "state-bucket-49702"
  remote_state_dynamodb_name = "state-table-49702"
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    key            = "${path_relative_to_include()}/test/terraform.tfstate"
    bucket         = local.remote_state_bucket_name
    dynamodb_table = local.remote_state_dynamodb_name
    encrypt        = true
    region         = "us-east-1"
    shared_credentials_file  = "${local.shared_credentials_files}"
    profile        = local.aws_profile
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
   terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17"
    }
  }
}

provider "aws" {
  region                   = "${local.aws_region}"
  shared_credentials_files =["${local.shared_credentials_files}"]
  profile                  = "${local.aws_profile}"
}
  EOF
}

inputs = merge(  
  local.region_vars.locals,
  local.profile_vars.locals,
  local.environment_vars.locals,
)
