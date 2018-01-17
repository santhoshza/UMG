# ALB create and configure

resource "aws_alb" "dockerregistry-alb" {
  name = "dockerregistry-alb"
  idle_timeout = 400

  subnets = ["${aws_subnet.main-public-1.id}","${aws_subnet.main-public-2.id}"]
  security_groups = ["${aws_security_group.dockerregistry-alb-securitygroup.id}"]

  tags {
    Name = "dockerregistry-alb"
  }
}

resource "aws_alb_target_group" "frontend-target-group" {
	name = "alb-target-group"
	port = 80
	protocol = "HTTP"
	vpc_id = "${aws_vpc.main.id}"

	
	health_check {
		healthy_threshold = 3
		unhealthy_threshold = 3
		timeout = 30
		protocol="HTTP"
		port="5000"
		path = "/"
		interval = 60
	}

}

resource "aws_alb_listener" "frontend-listeners" {
	load_balancer_arn = "${aws_alb.dockerregistry-alb.arn}"
	port = "80"
	
	default_action {
		target_group_arn = "${aws_alb_target_group.frontend-target-group.arn}"
		type = "forward"
	}
}

