[
  {
    "name": "http-echo",
    "image": "${app_image}",
    "cpu": ${fargate_cpu},
    "memory": ${fargate_memory},
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${app_port},
        "hostPort": ${app_port}
      }
    ],
   "command": [
      "--text",
      "Hello EdgeMaster! :-)"
   ]
  }
]
