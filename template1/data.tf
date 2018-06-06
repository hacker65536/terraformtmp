data "aws_caller_identity" "caller_id" {}

data "aws_canonical_user_id" "user_id" {}

data "aws_availability_zones" "azs" {}

data "aws_region" "region" {}
