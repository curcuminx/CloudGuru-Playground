
//data "aws_subnet_ids" "d_plg_subnets" {
//  vpc_id = local.plg_vpc_id
//}

// Create aws_ami filter to pick up the ami available in your region
data "aws_ami" "amazon-linux" {

  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_subnets" "d_private_subnets_ids" {
  tags = {
    Tier = "Private"
  }

  filter {
    name   = "vpc-id"
    values = [module.networking.plg_vpc.vpc_id]
  }

  depends_on = [module.networking]
}

data "aws_subnet" "d_private_subnets" {
  for_each = local.global.sections

  filter {
    name   = "tag:Section"
    values = [ each.value ]
  }

  depends_on = [module.networking]
}


data "aws_availability_zones" "available" {}


//data "aws_subnet" "d_private_subnets_HDFS" {
//
//  filter {
//    name   = "tag:Section"
//    values = [ local.global.sections.HDFS ]
//  }
//}

//data "aws_subnets" "d_private_subnets_ids" {
//  filter {
//    name   = "vpc-id"
//    values = [var.plg_vpc.vpc_id]
//  }
////
////  tags = {
////    Tier = "Private"
////  }
//}

//
//output "subnet_cidr_blocks" {
//  value = [for s in data.aws_subnet.d_private_subnet_ids : s.cidr_block]
//}