# By default, resources are created in "eu-west-1" region, which is "Ireland". It can overridden in vars.tf

# 1. This will make use of the previously build docker image pushed to AWS ECR "dockerapp"
#    Ensure you have a private/public key pair for EC2 instances
# 2. update vars.tf accordingly, mainly private/public key pair details, rest can be left default.
# 3. Run command "terraform apply" will create following things. (Please re-execute if it fails waiting on some resources to be created)
# a. ecs cluster - example-cluster
# b. ecs service - dockerapp
# c. elb - dockerapp-elb
# d. VPC & security groups - ecs, dockerapp-elb
# e. Roles & Policy - ecs-ec2-role, ecs-consul-server-role, ecs-service-role
# f. EC2 container - ecs-ec2-container
# g. Launch Config & AutoScaling group - ecs-launchconfig & ecs-example-autoscaling

# 2. ELB name will be displayed as output, which can be used to browse the container service, you should see Tomcat homepage.

	curl <ELB Name>