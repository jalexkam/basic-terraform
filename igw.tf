resource "aws_internet_gateway" "int_gw2" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.common-tag, { Name : "${local.common-tag.environment}-igw" })

}
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.pub_1.id
  tags          = merge(local.common-tag, { Name : "${local.common-tag.environment}-nat_gw" })

  depends_on = [aws_internet_gateway.int_gw]
}
