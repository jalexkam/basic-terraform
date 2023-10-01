locals { 
#  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
#  profile_vars = read_terragrunt_config(find_in_parent_folders("profile.hcl"))
#   environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))


  # Extract the variables we need for easy access
  shared_credentials_files ="/home/ec2-user/.aws/credentials"# "C:/Users/alex/.aws/credentials"  
  # aws_region = local.region_vars.locals.aws_region
  # aws_profile = local.profile_vars.locals.aws_profile


  #   remote_state_bucket_name =  local.region_vars.locals.remote_state_bucket_name
  #   remote_state_dynamodb_name = local.region_vars.locals.remote_state_dynamodb_name 

}


remote_state {
  backend = "local"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    path = "${path_relative_to_include()}/vpc/terraform.tfstate"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
        terraform { 
      required_version = ">=1.0.0"
      required_providers {
        aws = {
          source = "hashicorp/aws"
          version = "5.16"
        }
      }
    }

    provider "aws" {
      region  = "eu-west-1"
      profile = "alex-meli-card-admincli"
      shared_credentials_files =["${local.shared_credentials_files}"]
    }

  EOF
}


inputs = {
  project     = "Alex"
  region = "eu-est-1"
}

