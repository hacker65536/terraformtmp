variable "vpc_id" {
  default = "vpc-000000"
}

/*
vpc_id = "${data.aws_vpc.vpc.id}"
*/
data "aws_vpc" "vpc" {
  id = "${var.vpc_id}"
}

output "aws_provided_dns" {
  value = "${cidrhost(data.aws_vpc.vpc.cidr_block,2)}"
}
