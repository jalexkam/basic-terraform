##public
resource "aws_subnet" "pub" {
  count = length(var.public_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags                    = merge(local.common-tag, { Name : "${local.common-tag.environment}-pub_${count.index}" })
}

#private
resource "aws_subnet" "priv" {
  count = length(var.private_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnets[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags                    = merge(local.common-tag, { Name : "${local.common-tag.environment}-priv_${count.index}" })
}


#database
resource "aws_subnet" "db" {
  count = length(var.db_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.db_subnets[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags                    = merge(local.common-tag, { Name : "${local.common-tag.environment}-db${count.index}" })
}

