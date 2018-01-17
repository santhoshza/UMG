# docker registry

data "template_file" "dockerregistry-task-definition-template" {
  template               = "${file("templates/app.json.tpl")}"
  vars {
    REPOSITORY_URL = "${replace("${data.aws_ecr_repository.dockerregistry.repository_url}", "https://", "")}"
    AWS_REGION = "${var.AWS_REGION}"
	ACCESS_KEY = "${var.UMG_ACCESSKEY}"
	SECRET_KEY = "${var.UMG_SECRET}"
	S3_BUCKETNAME = "${aws_s3_bucket.b.arn}"
  }
}

resource "aws_ecs_task_definition" "dockerregistry-task-definition" {
  family                = "registry"
  container_definitions = "${data.template_file.dockerregistry-task-definition-template.rendered}"
  volume {
    name      = "auth"
    host_path = "/home/ec2-user/auth"
  }
}

resource "aws_ecs_service" "dockerregistry-service" {
  name = "dockerregistry"
  cluster = "${aws_ecs_cluster.example-cluster.id}"
  task_definition = "${aws_ecs_task_definition.dockerregistry-task-definition.arn}"
  desired_count = 1
  iam_role = "${aws_iam_role.ecs-service-role.arn}"
  depends_on = ["aws_iam_policy_attachment.ecs-service-attach1"]

  load_balancer {
    target_group_arn = "${aws_alb_target_group.frontend-target-group.arn}"
    container_name = "dockerregistry"
    container_port = 5000
  }
  lifecycle { ignore_changes = ["task_definition"] }
}

