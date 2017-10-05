resource "aws_launch_configuration" "launchconf" {
  name_prefix          = "${terraform.workspace}-launch-conf-"
  image_id             = "${data.aws_ami.ecs_ami.id}"
  instance_type        = "t2.large"
  key_name             = "${aws_key_pair.key.key_name}"
  security_groups      = ["${data.aws_security_group.sg.id}"]
  user_data            = "${data.template_cloudinit_config.cloud_init.rendered}"
  iam_instance_profile = "${aws_iam_instance_profile.ecs.arn}"

  root_block_device {
    volume_size           = "20"
    volume_type           = "gp2"
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = "/dev/xvdcz"
    volume_size           = "100"
    volume_type           = "gp2"
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
