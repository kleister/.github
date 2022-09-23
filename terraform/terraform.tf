terraform {
  backend "s3" {
    bucket = "kleister-terraform"
    key    = "github"
    region = "eu-central-1"
  }

  required_providers {
    cloudflare = {
      source  = "integrations/github"
      version = "~> 5.3.0"
    }
  }

  required_version = ">= 1.0"
}

provider "github" {
  owner = "kleister"
}
