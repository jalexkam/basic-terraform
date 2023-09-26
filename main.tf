module "my_vpc" {
  source = "./Modules/Vpc"

  aws_region  = "us-east-1"
  aws_profile = "alex-meli-card-admincli"
}
