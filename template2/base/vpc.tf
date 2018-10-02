resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  #default true
  enable_dns_support = true

  #default false
  enable_dns_hostnames = true

  tags = "${merge(var.tags, 
	map(
		"Name", "${terraform.workspace}-vpc",
	),
)}"
}
