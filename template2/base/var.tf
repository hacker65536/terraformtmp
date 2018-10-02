#variable "eks-cluster" {
#  default = "rds-comp2-eks-cluster"
#}

variable "secips" {
  default = [
    "202.214.96.1/32",
  ]
}
