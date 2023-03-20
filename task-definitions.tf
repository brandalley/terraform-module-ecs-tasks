data "aws_region" "current" {}

resource "aws_ecs_task_definition" "def" {
  # depends_on = [
  #   module.ecs
  # ]
  family = "${var.env}-${var.container_name}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = var.iam_ecs_task_execution_role_arn
  task_role_arn            = var.iam_ecs_task_role_arn
  container_definitions = <<DEFINITION
      [
        {
          "name": "${var.env}-container-${var.container_name}",
          "image": "${var.image_url}",
          "essential": true,
          "environment": [{"name": "DBPASS", "value": "${var.dbpass}"}],
          "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
              "awslogs-group": "${var.env}-container-${var.container_name}",
              "awslogs-region": "${data.aws_region.current.name}",
              "awslogs-stream-prefix": "ecs"
            }
          }
        }
      ]
      DEFINITION
}



