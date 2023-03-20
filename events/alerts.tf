# ECS Alerts

resource "aws_sns_topic" "ecs_events" {
  name = "${var.env}-events-topic"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.ecs_events.arn
  protocol  = "https"
  endpoint  = var.incident_management_webhook
}

resource "aws_cloudwatch_event_rule" "ecs_task_failure" {
  count         = length(var.ecs_service_list)
  name          = "${var.ecs_service_list[count.index]}-ecs-task-failed"
  description   = "Rule to monitor failures in ecs tasks"
  event_pattern = <<PATTERN
                  {
                    "source": ["aws.ecs"],
                    "detail-type": ["ECS Task State Change"],
                    "detail": {
                      "group": ["service:${var.ecs_service_list[count.index]}"],
                      "stoppedReason": [{
                        "anything-but": {
                          "prefix": "Scaling activity initiated by (deployment"
                        }
                      }],
                      "lastStatus": ["STOPPED"]
                    }
                  }
                  PATTERN
  is_enabled    = true
}

resource "aws_cloudwatch_event_target" "cloudwatch_alarms" {
  arn       = aws_sns_topic.ecs_events.arn
  target_id = "service-name-ecs-task-failed-event-target"
  rule      = aws_cloudwatch_event_rule.ecs_task_failure.name
  input     = "{\"Subject\":\"ALARM: ECS task failed - service-name\",\"AlarmDescription\":\"ECS task failed\"}"
}