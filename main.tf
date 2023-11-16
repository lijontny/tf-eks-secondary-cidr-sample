  #https://aws.amazon.com/about-aws/whats-new/2018/10/amazon-eks-now-supports-additional-vpc-cidr-blocks/

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = var.vpc_id
  cidr_block = "100.64.0.0/16"
}

resource "aws_subnet" "secondary_private_subnets" {
  count      = length(var.secondary_private_subnet_cidrs)
  vpc_id     = var.vpc_id
  cidr_block = element(var.secondary_private_subnet_cidrs, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "secondary_private_subnet_${count.index + 1}"
    Subnet_Usage = "eks_custom_cidr"
  }
}