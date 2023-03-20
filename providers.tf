provider "aws" {
  # AWS Region  
  region = "us-east-1"

  # Default tags used accross all resources created
  # Important when it comes to cost optimization in AWS
  default_tags {
    tags = {
      "Environment" = "Global"
      "Project"     = "boundless-interview"
      "ManagedBy"   = "Terraform"
      "Repository"  = "https://github.com/s709t/boundless-interview"
    }
  }
}