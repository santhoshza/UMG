output "access" {
  value = "${aws_iam_access_key.lb.id}"
}

output "secret" {
  value = "${aws_iam_access_key.lb.secret}"
}