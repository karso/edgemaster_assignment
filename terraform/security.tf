## --------------------------------
## Security Groups
## --------------------------------


## ALB Security Group

resource "aws_security_group" "lb" {
  name        = "bg-load-balancer-security-group"
  description = "controls access to the ALB"
  vpc_id      = aws_vpc.main.id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## ECS Cluster Security Group

resource "aws_security_group" "ecs_tasks" {
  name        = "bg-ecs-tasks-security-group"
  description = "allow inbound access from the ALB only"
  vpc_id      = aws_vpc.main.id

  ingress {
    protocol        = "tcp"
    from_port       = 80
    to_port         = 5678
    security_groups = ["${aws_security_group.lb.id}"]
  }

  ingress {
    protocol        = "tcp"
    from_port       = 443
    to_port         = 5678
    security_groups = ["${aws_security_group.lb.id}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
