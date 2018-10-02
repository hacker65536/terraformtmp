resource "aws_s3_bucket" "s3" {
  bucket        = "${terraform.workspace}-data"
  acl           = "private"
  tags          = "${var.tags}"
  force_destroy = true
}
