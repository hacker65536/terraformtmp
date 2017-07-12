terraform {
  required_version = ">=0.9.5"

  backend "s3" {
    bucket   = "terraform-remote-state"
    key      = "terraform.tfstate"
    region   = "us-west-2"
    role_arn = "arn:aws:iam::123456789012:role/RoleName"
    profile  = "default"
  }
}

data "terraform_remote_state" "rst" {
  backend = "s3"

  config {
    bucket   = "terraform-remote-state"
    key      = "terraform.tfstate"
    region   = "us-west-2"
    role_arn = "arn:aws:iam::123456789012:role/RoleName"
    profile  = "default"
  }
}
