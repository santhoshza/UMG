[
  {
    "essential": true,
    "memory": 256,
    "name": "dockerapp",
    "cpu": 256,
    "image": "${REPOSITORY_URL}:latest",
    "workingDirectory": "/usr/local/tomcat",
    "command": ["catalina.sh", "run"],
    "portMappings": [
        {
            "containerPort": 8080,
            "hostPort": 8080
        }
    ]
  }
]

