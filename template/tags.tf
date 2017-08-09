#   tags = "${merge(var.default_tags, map("Name", "my resource"))}"

variable "tags" {
  default = {
    Env    = "myenv"
    Author = "hacker65536"
    Build  = "terraform"
  }
}
