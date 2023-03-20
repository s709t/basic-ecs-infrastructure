resource "aws_wafv2_web_acl" "simple_waf" {
  name        = "${var.env}-wafv2"
  description = "Simple rate limiting waf"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "rule1"
    priority = 1

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit              = 10000
        aggregate_key_type = "IP"

        scope_down_statement {
          geo_match_statement {
            country_codes = ["US"]
          }
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "${var.ev}-wafv2-ratelimited"
      sampled_requests_enabled   = false
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "${var.ev}-wafv2"
    sampled_requests_enabled   = false
  }
}

resource "aws_wafv2_web_acl_association" "example" {
  resource_arn = var.alb_arn
  web_acl_arn  = aws_wafv2_web_acl.simple_waf.arn
}