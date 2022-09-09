resource "aws_s3_bucket" "helm_repository" {
  bucket = "mareshq-helm-repository"

  tags = {
    Name        = "mareshq-helm-repository"
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_website_configuration" "helm_repository" {
  bucket = aws_s3_bucket.helm_repository.bucket

  index_document {
    suffix = "index.yaml"
  }
}

resource "aws_s3_bucket_acl" "helm_repository" {
  bucket = aws_s3_bucket.helm_repository.bucket

  acl = "public-read"
}

output "helm_repository_bucket_website_endpoint" {
  value = aws_s3_bucket_website_configuration.helm_repository.website_endpoint
}
