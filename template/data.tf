data "aws_caller_identity" "current" {}

data "aws_canonical_user_id" "current" {}

data "aws_availability_zones" "az" {}

data "aws_region" "current" {
  current = true
}
