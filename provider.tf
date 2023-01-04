terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.73.0"
    }
  }

}

provider "aws" {
  shared_credentials_file = "/home/amaurybsouza/.aws"
  profile                 = "devopsaws"
  region                  = "us-east-1"
  default_tags {
    tags = {
      Environment = "Test"
      Owner       = "Amaury"
      maneged-by  = "Terraform"
         Project     = "Test"
    }
  }
}