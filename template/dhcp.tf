resource "aws_vpc_dhcp_options" "dhcp" {
  domain_name         = "${data.aws_region.current.name == "us-east-1" ? "ec2" : format("%s.compute",data.aws_region.current.name) }.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = "${merge(var.tags, map("Name", terraform.workspace))}"
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id          = "${aws_vpc.vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.dhcp.id}"
}
