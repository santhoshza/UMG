[
    {
      "volumesFrom": [],
      "portMappings": [
        {
          "hostPort": 5000,
          "containerPort": 5000,
          "protocol": "tcp"
        }
      ],
      "command": [
        "/etc/docker/registry/config.yml"
      ],
      "environment": [
        {
          "name": "REGISTRY_AUTH_HTPASSWD_REALM",
          "value": "basic-realm"
        },
        {
          "name": "REGISTRY_STORAGE_S3_ACCESSKEY",
          "value": "${ACCESS_KEY}"
        },
        {
          "name": "REGISTRY_STORAGE_S3_SECRETKEY",
          "value": "${SECRET_KEY}"
        },
        {
          "name": "REGISTRY_STORAGE_S3_REGION",
          "value": "${AWS_REGION}"
        },
        {
          "name": "REGISTRY_STORAGE_S3_BUCKET",
          "value": "${S3_BUCKETNAME}"
        },
        {
          "name": "REGISTRY_AUTH_HTPASSWD_PATH",
          "value": "/auth/htpasswd"
        }
      ],
      "essential": true,
      "entryPoint": [],
      "links": [],
      "mountPoints": [
        {
          "containerPath": "/auth",
          "sourceVolume": "auth",
          "readOnly": true
        }
      ],
      "memory": 256,
      "name": "dockerregistry",
      "cpu": 256,
      "image": "${REPOSITORY_URL}:latest"
    }
 ]
