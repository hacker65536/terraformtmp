resource "aws_ecs_cluster" "cluster" {
  name = "${terraform.workspace}-cluster"
}

data "aws_ecs_cluster" "cluster" {
  cluster_name = "${terraform.workspace}-cluster"
  depends_on   = ["aws_ecs_cluster.cluster"]
}
