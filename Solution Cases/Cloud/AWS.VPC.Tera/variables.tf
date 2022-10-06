variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  default     = "playground"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "env" {
  description = "Host Env Variables"
  type        = object({})
  default     = {}
}

//variable "module_outputs" {
//  type = object({})
//  default = {
//    networking = {
//      plg_vpc = module.networking.plg_vpc
//    }
//  }
//}

locals {
  dynamic = {
    module_outputs = {
      net = module.networking.outputs
    }

    data_sources = {
      net = {
        subnets_ids = data.aws_subnets.d_private_subnets_ids
        subnets = data.aws_subnet.d_private_subnets
      }
      ec2 = {
        ami = data.aws_ami.amazon-linux
        instances = {}
      }
    }
  }

  global_setup_aid = {
    sections = {
      app = "app"
      database = "database"
      hdfs = "hdfs"
    }
  }

  global = {
    cli_env = var.env
    sections = local.global_setup_aid.sections
    provider = {
      aws = {
        profile = "default"
        region  = var.region
      }
    }

    net = {
      module_name = "networking"
      vpc = {
        module_name = "vpc_plg"
        cidr      = "10.0.0.0/16"
        azs       = ["us-east-1a"]
        subnets   = {
              app      = ["10.0.1.0/28"]
              database = ["10.0.2.0/28"]
              hdfs     = ["10.0.3.0/28"]
              all      = ["10.0.1.0/28", "10.0.2.0/28" ,"10.0.3.0/28" ]
        }
      }
//      data_sources = local.global.data_sources.net
    }

    ec2 = {
      module_name = "ec2"
//      data_sources = local.global.data_sources.net
    }

    tags = {
      shared = {
        Terraform = "true"
        Environment = "dev"
      }

      vpc = {
        resource_name = "${var.namespace}.vpc"
      }

      subnets = {
        resource_name = { for sec in local.global_setup_aid.sections : sec => { Name: "${var.namespace}.${sec}.sn" } }
        tier = {
          Tier = "Private"
        }

      }
      ec2 = {
        resource_name = { for sec in local.global_setup_aid.sections : sec => { Name: "${var.namespace}.${sec}.inst" } }
        tier = {
          Tier = "Private"
        }
      }
    }
  }
}


