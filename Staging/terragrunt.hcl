include {
  path = find_in_parent_folders()
}

terraform {
  source = "../modules/vpc"
}

inputs = {
  cidr_block = "172.100.0.0/16"
  db_subnets = ["172.100.0.0/24", "172.100.1.0/24"]
  public_subnets = ["172.100.2.0/24", "172.100.3.0/24"]
  private_subnets = ["172.100.4.0/24", "172.100.5.0/24"]
  environment     = "Staging"
}