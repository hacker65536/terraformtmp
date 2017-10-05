resource "aws_key_pair" "key" {
  key_name   = "${terraform.workspace}_key_pair"
  public_key = "${file("./key_pair.pub")}"
}

/*

ssh-keygen -t rsa -N "" -f key_pair

*/

