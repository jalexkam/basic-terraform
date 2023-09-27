locals {
  common-tag = {
    environment : "${var.project}-${var.environment}"
  }
}
