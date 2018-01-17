# 1. Create AWS container repository ECR "dockerregistry" using "terraform apply" command.
# 2. Ensure your awscli is configured to use the correct region and credentials.
# 3. Build docker registry image using docker command "docker build -t <AWS ECR repo URL above>:latest ."
# 4. Login to AWS ECR using command "aws ecr get-login"
# 5. Push your image to ECR using command "docker push <AWS ECR repo URL above>:latest"
# 6. You are going to use this image in the next part to run the DockerRegistry in ECS.