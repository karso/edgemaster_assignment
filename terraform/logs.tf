## --------------------------------
## AWS CloudWatch Logs
## --------------------------------

resource "aws_cloudwatch_log_group" "bg_log_group" {
  name              = "/ecs/bg-app"
  retention_in_days = 7

  tags = {
    Name = "bg-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "bg_log_stream" {
  name           = "bg-log-stream"
  log_group_name = aws_cloudwatch_log_group.bg_log_group.name
}
