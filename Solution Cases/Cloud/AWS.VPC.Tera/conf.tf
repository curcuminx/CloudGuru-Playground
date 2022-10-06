terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.6"
    }
  }
}

provider "aws" {
  profile    = local.global.provider.aws.profile
  region     = local.global.provider.aws.region
}

