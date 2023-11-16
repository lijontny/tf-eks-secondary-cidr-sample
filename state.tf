#terraform {
#  backend "s3" {
#    bucket = "state-bucket"
#    key    = "state"
#    region = "eu-west-1"
#    dynamodb_table = "dynamodb_table-terraform"
#  }
#}