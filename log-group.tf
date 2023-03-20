resource "aws_cloudwatch_log_group" "containerlogs" {
  name = "${var.env}-container-${var.container_name}"
}