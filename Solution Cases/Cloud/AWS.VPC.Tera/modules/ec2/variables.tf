
variable "plg_vpc" {
  type = any
}

variable "global" {
  type = any
}

variable "dynamic" {
  type = any
}

locals {
  global = var.global
  dynamic = var.dynamic
}

//variable key_name {
//  type = string
//}
//
//variable "sg_pub_id" {
//  type = any
//}
//
//variable "sg_priv_id" {
//  type = any
//}