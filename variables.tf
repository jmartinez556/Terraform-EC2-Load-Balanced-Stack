variable "region" {
  type = string
}
variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "associate_public_ip_address" {
  type = string
}
variable "vpc_cidr_block" {
  type = string
}
variable "availability_zone1" {
  type = string
}
variable "public_subnet_1_cidr_block" {
  type = string
}
variable "availability_zone2" {
  type = string
}
variable "public_subnet_2_cidr_block" {
  type = string
}
variable "private_subnet_1_cidr_block" {
  type = string
}
variable "security_group1_name" {
  type = string
}
variable "ingress_rule_desc1" {
  type = string
}
variable "ingress_from_port1" {
  type = string
}
variable "ingress_to_port1" {
  type = string
}
variable "ingress_protocol1" {
  type = string
}
variable "ingress_cidr_blocks1" {
  type = list(string)
}
variable "egress_rule_desc1" {
  type = string
}
variable "egress_from_port1" {
  type = string
}
variable "egress_to_port1" {
  type = string
}
variable "egress_protocol1" {
  type = string
}
variable "launch_template_name" {
  type = string
}
variable "target_group_name" {
  type = string
}
variable "port" {
  type = number
}
variable "protocol" {
  type = string
}
variable "desired_capacity" {
  type = number
}
variable "max_size" {
  type = number
}
variable "min_size" {
  type = number
}
variable "load_balancer_name" {
  type = string
}
variable "domain" {
  type = string
}
variable "hosted_zone_id" {
  type = string
}
variable "domain_name" {
  type = string
}
variable "egress_cidr_blocks1" {
  type = string
}












