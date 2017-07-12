provider "aws" {
  region  = "ap-northeast-1"
  profile = "default"

  assume_role {
    role_arn     = "arn:aws:iam::123456789012:role/myRole"
    session_name = "session"
  }
}
