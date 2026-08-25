terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.23.0"
    }
  }
  backend "s3" {
    bucket         = "devops-recipe-app-tf-state-rmauricio"
    key            = "tf-state-setup"
    region         = "us-east-2"
    dynamodb_table = "devops-recipe-app-api-tf-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      Project     = var.project
      contact     = var.contact
      ManageBy    = "Terraform/setup"
      Environment = terraform.workspace
    }
  }
}

