variable "vpc_id" {
  #  default = "vpc-***"
}
variable "secondary_private_subnet_cidrs" {
  type        = list(string)
  description = "Secondary Private Subnet CIDR values"
  default     = ["100.64.0.0/18", "100.64.64.0/18"]
}
variable "security_groups" {
  type = set(string)
#  default = ["sg-*****"]
}