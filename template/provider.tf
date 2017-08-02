provider "aws" {
  # if empty this will provide from ENVIRONEMNT
}

data "aws_caller_identity" "current" {}

data "aws_canonical_user_id" "current" {}

data "aws_availability_zones" "az" {}

data "aws_region" "current" {
  current = true
}

output "canonical_user_id" {
  value = "${data.aws_canonical_user_id.current.display_name}"
}

output "region" {
  value = "${data.aws_region.current.name}"
}

output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "caller_arn" {
  value = "${data.aws_caller_identity.current.arn}"
}

output "caller_user" {
  value = "${data.aws_caller_identity.current.user_id}"
}

output "azs" {
  value = "${data.aws_availability_zones.az.names}"
}
