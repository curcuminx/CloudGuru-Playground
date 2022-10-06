output "outputs" {
  value = {
    plg_vpc_id = module.plg_vpc.vpc_id
  }
}

output "plg_vpc" {
  value = merge(module.plg_vpc , {})
}

//output "sg_pub_id" {
//  value = aws_security_group.allow_ssh_pub.id
//}
//
//output "sg_priv_id" {
//  value = aws_security_group.allow_ssh_priv.id
//}