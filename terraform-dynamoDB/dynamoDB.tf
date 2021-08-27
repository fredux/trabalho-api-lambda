provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "dynamoDB" {
  name   = "cliente"
#  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key   = "codigo"
  range_key  = "nome"
  
  attribute {
    name = "codigo"
    type = "S"
  }  
  
  attribute {
    name = "nome"
    type = "S"
  }  
  
  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }


 #local_secondary_indexes = [{
 #   name               = "customerId-city-index"
 #   range_key          = "city"
 #   projection_type    = "ALL"                   # ALL, INCLUDE or KEYS_ONLY
 #   non_key_attributes = []
 # }]
  
#  global_secondary_index {
#    name               = "GameTitleIndex"
#    hash_key           = "GameTitle"
#    range_key          = "TopScore"
#    write_capacity     = 10
#    read_capacity      = 10
#    projection_type    = "INCLUDE"
#    non_key_attributes = ["UserId"]
#  }

  tags = {
    Name        = "dynamodb-lab-senai"
    Environment = "dev"
  }
}