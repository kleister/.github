terraform {
  backend "s3" {
    bucket = "kleister-terraform"
    key    = "github"
    region = "eu-central-1"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.13.0"
    }
  }

  required_version = ">= 1.0"
}

provider "github" {
  owner = "kleister"
}
