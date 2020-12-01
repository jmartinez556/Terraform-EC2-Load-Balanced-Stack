region                      = "us-east-1"
ami                         = "ami-015839c0b166e9f34"
instance_type               = "t2.micro"
key_name                    = "Justin-us-east-1"
associate_public_ip_address = true
vpc_cidr_block              = "10.200.0.0/16"
availability_zone1          = "us-east-1c"
public_subnet_1_cidr_block  = "10.200.3.0/24"
availability_zone2          = "us-east-1b"
public_subnet_2_cidr_block  = "10.200.1.0/24"
private_subnet_1_cidr_block = "10.200.2.0/24"
security_group1_name        = "sec-grp-public-instances"
ingress_rule_desc1          = "allow all traffic"
ingress_from_port1          = 0
ingress_to_port1            = 0
ingress_protocol1           = "-1"
ingress_cidr_blocks1        = ["0.0.0.0/0"]
egress_rule_desc1           = "allow_all"
egress_from_port1           = 0
egress_to_port1             = 0
egress_protocol1            = "-1"
egress_cidr_blocks1         = ["0.0.0.0/0"]
launch_template_name        = "launch_21"
target_group_name           = "target_21"
port                        = "80"
protocol                    = "HTTP"
desired_capacity            = "2"
max_size                    = "3"
min_size                    = "1"
load_balancer_name          = "load_balance_21"
domain                      = "kiastests.com"