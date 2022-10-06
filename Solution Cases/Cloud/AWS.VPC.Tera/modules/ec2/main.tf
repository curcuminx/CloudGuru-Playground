
// Configure the EC2 instance in a private subnet
resource "aws_instance" "ec2_private" {
  for_each      = local.global.sections
  ami           = local.dynamic.data_sources.ec2.ami.id
  associate_public_ip_address = false
  instance_type               = "t2.micro"
  subnet_id                   = local.dynamic.data_sources.net.subnets[each.value].id

//    key_name                    = var.key_name
//    vpc_security_group_ids      = [var.sg_priv_id]

  tags = merge(local.global.tags.ec2.tier,
  {
    Section = each.value
    Name = local.global.tags.ec2.resource_name[each.value].Name
  })
}



//// Configure the EC2 instance in a public subnet
//resource "aws_instance" "ec2_public" {
//  ami           = "ami-0915bcb5fa77e48e2"
//  associate_public_ip_address = true
//  instance_type               = "t2.micro"
//  subnet_id                   = var.vpc.public_subnets[0]
////  vpc_security_group_ids      = [var.sg_pub_id]
//  //  key_name                    = var.key_name
//
//  tags = {
//    "Name" = "${var.namespace}-EC2-PUBLIC"
//  }


  # Copies the ssh key file to home dir
//  provisioner "file" {
//    source      = "./${var.key_name}.pem"
//    destination = "/home/ec2-user/${var.key_name}.pem"
//
//    connection {
//      type        = "ssh"
//      user        = "ec2-user"
//      private_key = file("${var.key_name}.pem")
//      host        = self.public_ip
//    }
//  }
//
//  //chmod key 400 on EC2 instance
//  provisioner "remote-exec" {
//    inline = ["chmod 400 ~/${var.key_name}.pem"]
//
//    connection {
//      type        = "ssh"
//      user        = "ec2-user"
//      private_key = file("${var.key_name}.pem")
//      host        = self.public_ip
//    }
//
//  }