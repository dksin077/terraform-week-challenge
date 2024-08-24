resource "aws_dynamodb_table" "dynamodb_table" {
  name           = var.dynamodb_name
  billing_mode   = "PAY_PER_REQUEST" # if we mak table so bill will generate "PROVISIONED"
  hash_key       = "LockID"                 # "UserId" primary key

  attribute {
    name = "LockID"
    type = "S"                 # string
  }
  tags = {
    Name        = "dynamodb-table-1"
    Environment = "prod"
  }
}
