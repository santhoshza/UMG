# By default, resources are created in "eu-west-1" region, which is "Ireland". It can be overridden in vars.tf

# 1. Create AWS container repository ECR "dockerapp" using "terraform apply" command.
# 2. Ensure your awscli is configured to use the correct region and credentials.
# 3. Build docker image using docker command "docker build -t <AWS ECR repo URL above>:latest ."
# 4. Login to AWS ECR using command "aws ecr get-login"
# 5. Push your image to ECR using command "docker push <AWS ECR repo URL above>:latest"
# 6. You will use this image in the next demo to spin ECS cluster and run this image container inside it.