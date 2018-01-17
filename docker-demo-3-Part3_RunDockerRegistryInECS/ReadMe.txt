# By default, resources are created in "eu-west-1" region, which is "Ireland". It can overridden in vars.tf

# 1. This will make use of the previously build docker image pushed to AWS ECR "dockerregistry"
#    Ensure you have a private/public key pair for EC2 instances
# 2. update vars.tf accordingly, mainly the private/public key pair and UMG user ACCESSKEY & SECRET.
# 3. Run command "terraform apply" will create following things,  (Please re-execute if it fails waiting on some resources to be created)
# a. ecs cluster - example-cluster
# b. ecs service - dockerregistry
# c. alb - dockerregistry-alb
# d. VPC & security groups - ecs, dockerregistry-alb
# e. Roles & Policy - ecs-ec2-role, ecs-consul-server-role, ecs-service-role
# f. EC2 container - ecs-ec2-container
# g. Launch Config & AutoScaling group - ecs-launchconfig & ecs-example-autoscaling
# i. S3 Bucket Name - docker-s3-umg-5er34tr76ty

# 4. ALB name will be displayed as output, which can be used to browse the container service as shown below, you will be asked for username/password(umg/MeerKatsAreGreat).

	http://<ALB Name/v2/

# 5. The output should be as below,

	{}