variable "aws_profile" {
  description = "AWS Profile"
  type        = string
}

variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "environment" {
  description = "environment"
  type        = string
}

variable "location" {
  description = "location"
  type        = string
}

variable "aws_shared_credential_Location" {
  description = "location"
  type        = string
  default     = "/home/ec2-user/.aws/credentials "
  # the default is the atlantis on 
  # to run int on my local PC use : C:\Users\alex\.aws  
  # /home/ec2-user/.aws/credentials 
  # where alex is the user logged in
}

