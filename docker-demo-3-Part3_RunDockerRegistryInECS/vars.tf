variable "AWS_REGION" {
  default = "eu-west-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey.pem"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey"
}
variable "ECS_INSTANCE_TYPE" {
  default = "t2.micro"
}
variable "ECS_AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-ba722dc0"
    us-west-2 = "ami-c9c87cb1"
    eu-west-1 = "ami-acb020d5"
  }
}
# Full List: http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html

variable "UMG_ACCESSKEY" {
  default = "<umg user ACCESS KEY HERE>"
}
variable "UMG_SECRET" {
  default = "<umg user SECRET HERE>"
}
