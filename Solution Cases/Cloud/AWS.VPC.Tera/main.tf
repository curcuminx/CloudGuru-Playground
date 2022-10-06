
module "networking" {
  source    = "modulesnetworking"
  depends_on = [local.global]

  global = local.global

}

module "ec2" {
  source     = "modulesec2"
  depends_on = [module.networking.plg_vpc]

  global  = local.global
  dynamic = local.dynamic
  plg_vpc = module.networking.plg_vpc

//  sg_pub_id  = module.networking.sg_pub_id
//  sg_priv_id = module.networking.sg_priv_id
//  key_name   = module.ssh-key.key_name
}

//module "ssh-key" {
//  source    = "./modules/ssh-key"
//  namespace = var.namespace
//}


//root-module
//  locals
//  variables
//  modules
//    sub-mod1
//      variables
//      locals
//    sub-mod2
//
//local.global -> root-module.var
//local.global -> sub-mod1.var + sub-mod.locals