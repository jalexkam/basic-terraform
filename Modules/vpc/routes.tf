/* Public */
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.common-tag, { Name : "${local.common-tag.environment}-public-route" })
}

resource "aws_route_table_association" "public_association" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.pub[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "public_default" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.int_gw.id
  destination_cidr_block = "0.0.0.0/0"
}

/* Private */
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.common-tag, { Name : "${local.common-tag.environment}-private-route" })
}

resource "aws_route_table_association" "private_association" {
  count          = length(var.private_subnets)
  subnet_id      = aws_subnet.priv[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route" "private_default" {
  route_table_id         = aws_route_table.private.id
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
  destination_cidr_block = "0.0.0.0/0"
}

/* Database */
resource "aws_route_table" "database" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.common-tag, { Name : "${local.common-tag.environment}-database-route" })
}

resource "aws_route_table_association" "db_association" {
  count          = length(var.db_subnets)
  subnet_id      = aws_subnet.db[count.index].id
  route_table_id = aws_route_table.database.id
}

resource "aws_route" "database_default" {
  route_table_id         = aws_route_table.database.id
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
  destination_cidr_block = "0.0.0.0/0"
}
