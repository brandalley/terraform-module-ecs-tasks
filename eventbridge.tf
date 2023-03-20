resource "aws_cloudwatch_event_rule" "rule" {
  name = "${var.env}-${var.container_name}"
  schedule_expression = "cron(${var.cron})"
}

resource "aws_cloudwatch_event_target" "target" {
  rule      = aws_cloudwatch_event_rule.rule.name
  target_id = "${var.env}-ecs-cluster"
  arn       = var.ecs_cluster_arn
  role_arn = var.iam_ecs_task_execution_role_arn

  ecs_target {
    task_count          = 1
    task_definition_arn = aws_ecs_task_definition.def.arn
    launch_type = "FARGATE"
    network_configuration {
        security_groups = var.security_groups
        subnets         = var.subnets
  }
  }

    
}