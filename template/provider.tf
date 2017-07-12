provider "aws" {
  # if empty this will provide from ENVIRONEMNT
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {
  current = true
}
