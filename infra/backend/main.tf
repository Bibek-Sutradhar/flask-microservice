resource "aws_s3_bucket" "state_bucket" {
  bucket = "terraformbackend-ue1"
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encrypt" {
    bucket = aws_s3_bucket.state_bucket.id
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
}

resource "aws_dynamodb_table" "statelock" {
  name = "state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}