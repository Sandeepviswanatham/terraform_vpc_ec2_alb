# module "vpc" {
#   source = "../../"

#   name = local.name
#   cidr = "10.0.0.0/16"

#   azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

#   enable_ipv6 = true

#   enable_nat_gateway = false
#   single_nat_gateway = true

#   public_subnet_tags = {
#     Name = "overridden-name-public"
#   }

#   tags = local.tags

#   vpc_tags = {
#     Name = "vpc-name"
#   }
# }
module "vpc" {
source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

azs          = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]


  enable_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}