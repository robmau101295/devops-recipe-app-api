terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket               = "devops-recipe-app-tf-state-rmauricio"
    key                  = "tf-state-deploy"
    workspace_key_prefix = "tf-state-deploy-env"
    region               = "us-east-2"
    encrypt              = true
    dynamodb_table       = "devops-recipe-app-api-tf-lock"
  }

}

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      Project     = var.project
      contact     = var.contact
      ManageBy    = "Terraform/deploy"
      Environment = terraform.workspace
    }
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
}

data "aws_region" "current" {}
