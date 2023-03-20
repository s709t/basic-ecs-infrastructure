# boudless-interview

### Terraform modules:

- ./ecr ( creates ECR Repository and lifecycle)
- ./ecs ( creates ECS Service, ECS Taskdefinition, ALB, roles)
- ./network ( creates VPC, 6 subnets -> 3 public - 3 privates, 3 AZ )
- ./events ( creates EventBridge rules that triggers Cloudwatch Alarms and notifies an SNS topic linked to a webhook for pagerduty, zenduty, or oncall sofware)
- ./waf ( waf with simple ratelimiting rule)

### Main structure 
- ./backend.tf ( Remote Backend code )
- ./outputs.tf ( Posible outputs )
- ./providers.tf ( Providers configs, using default tags will tag everything by default )
- ./variables.tf ( Variables declaration)
- ./versions.tf ( Providers versions )
- ./global.tfvars (terraform variables)


### Nice to have

- private links with ECR: will decrease around 90% charges on NAT usage on ECS-ECR connections
- tfsec: scans terraform code for vulnerabilities 
- expand waf rules to cover owasp top 10