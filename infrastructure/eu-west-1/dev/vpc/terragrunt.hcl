locals { 
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  profile_vars = read_terragrunt_config(find_in_parent_folders("profile.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract the variables we need for easy access
  shared_credentials_files =    local.profile_vars.locals.shared_credentials_files 
  aws_region = local.region_vars.locals.aws_region
  aws_profile = local.profile_vars.locals.aws_profile
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/vpc"
}

