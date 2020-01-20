## --------------------------------
## ECS
## --------------------------------


## Create ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "bg-cluster"
}

## Create TaskDef

data "template_file" "bg_app" {
  template = "${file("templates/ecs/bg_app.json.tpl")}"

  vars = {
    app_image      = var.app_image
    fargate_cpu    = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region     = var.aws_region
    app_port       = var.app_port
    display_string = var.display_string
  }
}

resource "aws_ecs_task_definition" "http-echo" {
  family                   = "bg-app-task"
  execution_role_arn       = var.ecs_task_execution_role
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = data.template_file.bg_app.rendered
}

## Create service

resource "aws_ecs_service" "main" {
  name            = "bg-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.http-echo.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = aws_subnet.private.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.http-echo.id
    container_name   = "http-echo"
    container_port   = 5678
  }

  depends_on = [
    aws_lb_listener.front_end_fwd,
    aws_lb_listener.front_end_redir,
  ]
}
