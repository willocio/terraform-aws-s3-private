resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-test-bucket-willian-locio-12052024-terraform"

   tags = {
    Name        = "My bucket"
    Environment = "Project"
  }
}

resource "aws_s3_bucket_ownership_controls" "my-controls" {
  bucket = aws_s3_bucket.my-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "my-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.my-controls]

  bucket = aws_s3_bucket.my-bucket.id
  acl    = "private"
}