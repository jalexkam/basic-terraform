#terraform {
  #source = "./modules/vpc"
#}

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
    provider "aws" {
      region  = "eu-west-1"
      profile = "alex-meli-card-admincli"
    }
  EOF
}

inputs = {
  project     = "Alex"
  region = "eu-est-1"
}