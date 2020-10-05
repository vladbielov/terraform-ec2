variable "environment" {
  type    = string
}

variable "vpc_cidr_block" {
  type    = string
}

variable "public_cidr1" {
  type    = string
}

variable "public_cidr2" {
  type    = string
}
variable "public_cidr3" {
  type    = string
}

variable "private_cidr1" {
  type    = string
}

variable "private_cidr2" {
  type    = string
}

variable "private_cidr3" {
  type    = string
}

variable "az1" {
  type    = string
}

variable "az2" {
  type    = string
}

variable "az3" {
  type    = string
}

#
environment               = var.environment
  vpc_cidr_block            = var.vpc_cidr_block
  availability_zones        = [ var.az1, var.az2, var.az3 ]
  public_subnet_cidr_blocks = [ var.public_cidr1, var.public_cidr2, var.public_cidr3 ]
  private_subnet_cidr_blocks = [ var.private_cidr1, var.private_cidr2, var.private_cidr3 ]
#

variable "region" {
  type    = string
}

variable "key_name" {
  type    = string
  default = "laptop-key"
}

variable "public_key" {
  type    = string
}

variable "ami_id" {
  type    = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_port" {
  type    = string
  default = "22"
}

variable "http_port" {
  type    = string
  default = "80"
}

variable "https_port" {
  type    = string
  default = "443"
}

variable "any_port" {
  type    = string
  default = "0"
}

variable "any_protocol" {
  type    = string
  default = "-1"
}

variable "tcp_protocol" {
  type    = string
  default = "tcp"
}

variable "all_ips" {
  type    = list
  default = ["0.0.0.0/0"]
}

data "aws_vpcs" "my-vpc" {
  tags = {
    environment = var.environment
  }
}

data "aws_subnet_ids" "my-subnets" {
  vpc_id = tolist(data.aws_vpcs.my-vpc.ids)[0]
}
