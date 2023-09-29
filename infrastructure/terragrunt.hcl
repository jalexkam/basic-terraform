locals { 
 // region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
 // profile_vars = read_terragrunt_config(find_in_parent_folders("profile.hcl"))
  //environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
   environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))


  # Extract the variables we need for easy access
  shared_credentials_files =    local.profile_vars.locals.shared_credentials_files 
  aws_region = local.region_vars.locals.aws_region
  aws_profile = local.profile_vars.locals.aws_profile
}

# terraform {
#   required_version = ">= 1.0"
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "5.17"
#     }
#   }
# }

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    key            = "${path_relative_to_include()}/vpc/terraform.tfstate"
    bucket         = "state-bucket-62746"
    dynamodb_table = "state-table-62746"
    encrypt        = true
    region         = "us-east-1"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
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
  region                   = "us-east-1"
  shared_credentials_files = ["%USERPROFILE%/.aws/credentials"]
  shared_config_files      = ["%USERPROFILE%/.aws/conf"]
  profile                  = "alex-meli-card-admincli"
}

  EOF
}

inputs = merge(  
  local.region_vars.locals,
  local.profile_vars.locals,
  local.environment_vars.locals,
)
