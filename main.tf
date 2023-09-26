module "my_vpc" {
  providers = {
    aws = aws
  }
  source = "./Modules/Vpc"

  aws_region  = "us-east-1"
  aws_profile = "alex-meli-card-admincli"
}
