variable "region" {}

variable "profile" {}

variable "role_arn" {}

variable "session_name" {}

provider "aws" {
  /*
export TF_VAR_region=ap-northeast-1
export TF_VAR_profile=default
export TF_VAR_role_arn='arn:aws:iam::0000000000000000:role/roelname'
export TF_VAR_session_name='yourname'
*/

  # if empty this will provide from ENVIRONEMNT
  region = "${var.region}"

  profile = "${var.profile}"

  assume_role {
    role_arn     = "${var.role_arn}"
    session_name = "${var.session_name}"
  }
}
