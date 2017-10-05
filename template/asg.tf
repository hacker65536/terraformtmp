resource "aws_autoscaling_group" "asg" {
  name     = "${terraform.workspace}-asg"
  max_size = "4"
  min_size = "0"

  #  desired_capacity     = "0"
  launch_configuration = "${aws_launch_configuration.launchconf.name}"
  vpc_zone_identifier  = ["${data.aws_subnet_ids.subnets.ids}"]
  enabled_metrics      = ["${var.group_metrics_collection}"]

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${terraform.workspace}-asg"
    propagate_at_launch = true
  }

  tag {
    key                 = "Env"
    value               = "${terraform.workspace}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Author"
    value               = "${lookup(var.tags,"Author")}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Build"
    value               = "${lookup(var.tags,"Build")}"
    propagate_at_launch = true
  }

  depends_on = ["aws_launch_configuration.launchconf"]
}
