# S3 bucket
resource "aws_s3_bucket" "b" {
    bucket = "docker-s3-umg-5er34tr76ty"
	acl = "private"
	
	tags {
		Name = "UMG Bucket"
		Environment = "Test"
	}
}
