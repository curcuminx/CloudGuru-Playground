
//output "screen" {
//  value = module.networking.plg_vpc.private_subnets
//}

//output "screen" {
//  value = local.global
//}

output "screen" {
  value = {
    global = local.global
    dynamic = local.dynamic
  }
}