output "alb" {
  value = "${aws_alb.dockerregistry-alb.dns_name}"
}

output "s3" {
	value = "${aws_s3_bucket.b.arn}"
}