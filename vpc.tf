# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = false
  tags                 = merge(local.common-tag, { Name : "${local.common-tag.environment}-vpc" })
}







