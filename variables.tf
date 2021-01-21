// APPLICATION VARIABLES
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "app_name" {
  type = string
}

// VPC VARIABLES
variable "vpc_cidr_block" {
  type    = string
  default = "10.200.0.0/16"
}

# PUBLIC SUBNET VARIABLES
variable "public_subnet_1_cidr_block" {
  type    = string
  default = "10.200.1.0/24"
}
variable "public_subnet_2_cidr_block" {
  type    = string
  default = "10.200.2.0/24"
}
variable "public_subnet_3_cidr_block" {
  type    = string
  default = "10.200.3.0/24"
}

# PRIVATE SUBNET VARIABLES
variable "private_subnet_1_cidr_block" {
  type    = string
  default = "10.200.4.0/24"
}
variable "private_subnet_2_cidr_block" {
  type    = string
  default = "10.200.5.0/24"
}
variable "private_subnet_3_cidr_block" {
  type    = string
  default = "10.200.6.0/24"
}

// LAUNCH TEMPLATE VARIABLES
variable "ami" {
  type = string
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  type = string
}

// AUTOSCALING VARIABLES
variable "desired_capacity" {
  type    = number
  default = 1
}
variable "max_size" {
  type    = number
  default = 1
}
variable "min_size" {
  type    = number
  default = 1
}

// TARGET GROUP VARIABLES
variable "port" {
  type = number
}
variable "protocol" {
  type = string
}

// LOAD BALANCER VARIABLES
variable "domain" {
  type = string
}

// ROUTE 53 VARIABLES
variable "domain_name" {
  type = string
}
variable "hosted_zone_id" {
  type = string
}





