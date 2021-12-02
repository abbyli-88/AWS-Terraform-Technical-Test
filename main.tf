provider "aws" {
  region  = "ap-southeast-2"
  profile = "default"
}

module "key-pair" {
  source = "modules/key-pair"
  count = var.instance_count
  key_name = var.key_name[count.index]
}

resource "random_pet" "server" {
  count = var.instance_count
}

module "ec2" {
  source = "modules/ec2"
  count = var.instance_count
  ami = var.ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone[count.index]
  subnet_name = var.subnet_name[count.index]
  key_name = module.key-pair[count.index].key-name
  name_tag = "web-server-${random_pet.server[count.index].id}"
}