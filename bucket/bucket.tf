resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-brabus-ronaldo"

  tags = {
    owner      = "ronaldo"
    managed-by = "terraform"
  }
}