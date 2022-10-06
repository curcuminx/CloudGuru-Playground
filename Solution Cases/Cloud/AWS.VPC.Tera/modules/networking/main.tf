
module "plg_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~>2.7"
  name    = local.global.net.vpc.module_name
  cidr    = local.global.net.vpc.cidr
  azs     = local.global.net.vpc.azs

  enable_nat_gateway               = true
  single_nat_gateway               = false
//  one_nat_gateway_per_az           = true

//  reuse_nat_ips       = true                 # <= Skip creation of EIPs for the NAT Gateways
//  external_nat_ip_ids = "${aws_eip.plg-nat.*.id}"   # <= IPs specified here as input to the module

  tags = merge(local.global.tags.shared, local.global.tags.vpc)

}

resource "aws_subnet" "plg_vpc_subnet" {
  for_each = local.global.sections

  vpc_id     = module.plg_vpc.vpc_id
  cidr_block = local.global.net.vpc.subnets[each.value][0]

  tags = merge(local.global.tags.subnets.tier,
  {
    Section = each.value
    Name = local.global.tags.subnets.resource_name[each.value].Name
  })
}

resource "aws_eip" "plg-nat" {
  count = 1
  vpc = true

  tags = {
    Name = "plg-EIP"
  }
}


//// SG to allow SSH connections from anywhere
//resource "aws_security_group" "allow_ssh_pub" {
//  name        = "${var.namespace}-allow_ssh"
//  description = "Allow SSH inbound traffic"
//  vpc_id      = module.vpc.vpc_id
//
//  ingress {
//    description = "SSH from the internet"
//    from_port   = 22
//    to_port     = 22
//    protocol    = "tcp"
//    cidr_blocks = ["0.0.0.0/0"]
//  }
//
//  egress {
//    from_port   = 0
//    to_port     = 0
//    protocol    = "-1"
//    cidr_blocks = ["0.0.0.0/0"]
//  }
//
//  tags = {
//    Name = "${var.namespace}-allow_ssh_pub"
//  }
//}
//
//// SG to onlly allow SSH connections from VPC public subnets
//resource "aws_security_group" "allow_ssh_priv" {
//  name        = "${var.namespace}-allow_ssh_priv"
//  description = "Allow SSH inbound traffic"
//  vpc_id      = module.vpc.vpc_id
//
//  ingress {
//    description = "SSH only from internal VPC clients"
//    from_port   = 22
//    to_port     = 22
//    protocol    = "tcp"
//    cidr_blocks = ["10.0.0.0/16"]
//  }
//
//  egress {
//    from_port   = 0
//    to_port     = 0
//    protocol    = "-1"
//    cidr_blocks = ["0.0.0.0/0"]
//  }
//
//  tags = {
//    Name = "${var.namespace}-allow_ssh_priv"
//  }
//}