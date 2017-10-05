data "aws_iam_policy_document" "ec2_assume" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs" {
  name               = "${terraform.workspace}-ecsinstanceRole"
  assume_role_policy = "${data.aws_iam_policy_document.ec2_assume.json}"
}

resource "aws_iam_instance_profile" "ecs" {
  name = "${terraform.workspace}-ecsinstanceRole"
  role = "${aws_iam_role.ecs.name}"
}

resource "aws_iam_role_policy_attachment" "ecs_srv" {
  role       = "${aws_iam_role.ecs.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}
