provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "dynamoDB" {
  name   = "cliente"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key   = "codigo"
  #range_key  = "nome"
  
  attribute {
    name = "codigo"
    type = "S"
  }  
  

  
  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }



  tags = {
    Name        = "dynamodb-lab-senai"
    Environment = "dev"
  }
}
