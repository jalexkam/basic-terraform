resource "aws_eip" "nat_eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.int_gw]
  tags       = merge(local.common-tag, { Name : "new-Another-${local.common-tag.environment}-eip" })
}
