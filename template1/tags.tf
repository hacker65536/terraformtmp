#   tags = "${merge(var.tags, map("Name", "my resource"))}"
variable "tags" {
  default = {
    Env    = "myEnv"
    Author = "MyName"
    Build  = "terraform"
  }
}
