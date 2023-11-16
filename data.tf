data "aws_availability_zones" "available" {}
data "aws_region" "region" {}
data "aws_subnet" "subnet-az1" {
  depends_on = [
    aws_subnet.secondary_private_subnets
  ]
  filter {
    name   = "tag:Subnet_Usage"
    values = ["eks_custom_cidr"]
  }
  filter {
    name   = "availability-zone"
    values = ["${data.aws_region.region.name}a"]
  }
}
data "aws_subnet" "subnet-az2" {
  depends_on = [
    aws_subnet.secondary_private_subnets
  ]
  filter {
    name   = "tag:Subnet_Usage"
    values = ["eks_custom_cidr"]
  }
  filter {
    name   = "availability-zone"
    values = ["${data.aws_region.region.name}b"]
  }
}