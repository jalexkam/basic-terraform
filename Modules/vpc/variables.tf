##################################################################################
# VARIABLES
##################################################################################

variable "region" {
  type        = string
  description = "(Optional) AWS Region to use. Default: us-east-1"
  default     = "eu-west-1"
}

variable "cidr_block" {
  type        = string
  description = "(Optional) The CIDR block for the VPC."
  default     = "10.0.0.0/16"

}

variable "public_subnets" {
  type        = list(string)
  description = "(Optional) Map of public subnets to create with CIDR blocks. Key will be used as subnet name with prefix"
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_subnets" {
  type        = list(string)
  description = "(Optional) Map of private subnets to create with CIDR blocks. Key will be used as subnet name with prefix"
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}



variable "db_subnets" {
  type        = list(string)
  description = "(Optional) Map of db subnets to create with CIDR blocks. Key will be used as subnet name with prefix"
  default     = ["10.0.4.0/24", "10.0.5.0/24"]
}


variable "environment" {
  type        = string
  description = "(required) Environment for all resources"
  default     = "Local"
}


variable "project" {
  type        = string
  description = "(required) billing code  for network resources"
  default     = "LEX"
}
