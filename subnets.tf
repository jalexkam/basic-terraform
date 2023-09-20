##public
resource "aws_subnet" "pub_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags                    = merge(local.common-tag, { Name : "${local.common-tag.environment}-pub_1" })
}

resource "aws_subnet" "pub_2" {
  vpc_id = aws_vpc.vpc.id

  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags              = merge(local.common-tag, { Name : "${local.common-tag.environment}-pub_2" })
}

#private
resource "aws_subnet" "priv_1" {
  vpc_id = aws_vpc.vpc.id

  cidr_block              = "10.0.2.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags                    = merge(local.common-tag, { Name : "${local.common-tag.environment}-priv_1" })
}

resource "aws_subnet" "priv_2" {
  vpc_id = aws_vpc.vpc.id

  cidr_block        = "10.0.3.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags              = merge(local.common-tag, { Name : "${local.common-tag.environment}-priv_2" })
}




#database
resource "aws_subnet" "db1" {
  vpc_id = aws_vpc.vpc.id

  cidr_block              = "10.0.4.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags                    = merge(local.common-tag, { Name : "${local.common-tag.environment}-db1" })
}

resource "aws_subnet" "db2" {
  vpc_id = aws_vpc.vpc.id

  cidr_block        = "10.0.5.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags              = merge(local.common-tag, { Name : "${local.common-tag.environment}-db2" })
}

