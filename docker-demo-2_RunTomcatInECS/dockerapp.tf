# docker app

data "template_file" "dockerapp-task-definition-template" {
  template               = "${file("templates/app.json.tpl")}"
  vars {
    REPOSITORY_URL = "${replace("${data.aws_ecr_repository.dockerapp.repository_url}", "https://", "")}"
	
  }
}

resource "aws_ecs_task_definition" "dockerapp-task-definition" {
  family                = "dockerapp"
  container_definitions = "${data.template_file.dockerapp-task-definition-template.rendered}"
}

resource "aws_elb" "dockerapp-elb" {
  name = "dockerapp-elb"

  listener {
    instance_port = 8080
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 3
    unhealthy_threshold = 3
    timeout = 30
    target = "HTTP:8080/"
    interval = 60
  }

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  subnets = ["${aws_subnet.main-public-1.id}"]
  security_groups = ["${aws_security_group.dockerapp-elb-securitygroup.id}"]

  tags {
    Name = "dockerapp-elb"
  }
}

resource "aws_ecs_service" "dockerapp-service" {
  name = "dockerapp"
  cluster = "${aws_ecs_cluster.example-cluster.id}"
  task_definition = "${aws_ecs_task_definition.dockerapp-task-definition.arn}"
  desired_count = 1
  iam_role = "${aws_iam_role.ecs-service-role.arn}"
  depends_on = ["aws_iam_policy_attachment.ecs-service-attach1"]

  load_balancer {
    elb_name = "${aws_elb.dockerapp-elb.name}"
    container_name = "dockerapp"
    container_port = 8080
  }
  lifecycle { ignore_changes = ["task_definition"] }
}

