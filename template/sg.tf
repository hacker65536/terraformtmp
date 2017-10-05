data "aws_security_group" "sg" {
  #  id = "${var.security_group_id}"
  id = "${aws_security_group.sg.id}"
}

resource "aws_security_group" "sg" {
  name_prefix = "${terraform.workspace}-sg"
  description = "self"
  vpc_id      = "${data.aws_vpc.vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(var.tags, map("Name", "${terraform.workspace}-sg-sec"),map("Env",terraform.workspace))}"
}

resource "aws_security_group_rule" "sg1" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  self              = true
  security_group_id = "${aws_security_group.sg.id}"
}

resource "aws_security_group_rule" "sg2" {
  count             = "${length(var.ips)}"
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["${element(var.ips,count.index)}"]
  security_group_id = "${aws_security_group.sg.id}"
}

variable "ips" {
  default = [
    #edit
    "192.168.1.101/32",
  ]
}
