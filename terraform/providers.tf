# Terraform version requirement
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.43"
    }
  }
  
  # Configure the S3 backend for storing the Terraform state file
  # backend "s3" {
  #   bucket = "nodejs-app-terraform-state"
  #   dynamodb_table = "terraform-locks"
  #   key    = "nodejs-app/env:/${terraform.workspace}/terraform.tfstate"
  #   region = var.aws_region
  #   encrypt = true
  # }
}

# Define AWS region
provider "aws" {
  region = var.region
}

# Define local values
locals {
  env = terraform.workspace
}