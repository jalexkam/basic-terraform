include {
  path = find_in_parent_folders()
}

terraform {
    extra_arguments "common_var" {
      commands  = get_terraform_commands_that_need_vars()
      arguments = ["-var-file=${get_terragrunt_dir()}/terraform.tfvars"]
    }

      source = "../modules/vpc"
  }
  
inputs = {
  cidr_block = "192.168.0.0/16"
  db_subnets = ["192.168.0.0/24", "192.168.1.0/24"]
  public_subnets = ["192.168.2.0/24", "192.168.3.0/24"]
  private_subnets = ["192.168.4.0/24", "192.168.5.0/24"]
  environment     = "Development"
}