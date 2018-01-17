output "elb" {
  value = "${aws_elb.dockerapp-elb.dns_name}"
}
