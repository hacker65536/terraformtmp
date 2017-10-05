data "template_file" "cloud_init_config" {
  template = "${file("${path.cwd}/cloud-init/init.cfg")}"

  #  vars {
  #    hostname                   = "${terraform.workspace}.${data.aws_route53_zone.local.name}"
  #    search_domain              = "${data.aws_route53_zone.local.name}"
  #    aws_search_domain_internal = "${data.aws_region.current.name}.compute.internal"
  #    nameserver                 = "${cidrhost(data.aws_vpc.vpc.cidr_block,2)}"
  #    region                     = "${data.aws_region.current.name}"
  #  }
}

data "template_file" "ecs_param" {
  template = "${file("${path.cwd}/cloud-init/ecs_param.sh")}"

  vars {
    ecs_cluster = "${data.aws_ecs_cluster.cluster.cluster_name}"

    #ecs_instance_attributes = "{\"placement-tier\":\"${terraform.workspace}-tier\"}"
  }
}

data "template_cloudinit_config" "cloud_init" {
  gzip          = true
  base64_encode = true

  part {
    filename = "init.cfg"

    #content_type = "text/cloud-config"
    content = "${data.template_file.cloud_init_config.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.ecs_param.rendered}"
  }

  #  part {
  #    content_type = "text/x-shellscript"
  #    content      = "${data.template_file.start_task_dd.rendered}"
  #  }
}
