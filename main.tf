module "my_vpc" {
  providers = {
    aws = aws
  }
  source = "./Modules/Vpc"

  #   aws_region  = var.aws_region
  #   aws_profile = var.aws_profile
}
