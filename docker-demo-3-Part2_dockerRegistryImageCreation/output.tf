output "dockerapp-repository-URL" {
  value = "${aws_ecr_repository.dockerregistry.repository_url}"
}
