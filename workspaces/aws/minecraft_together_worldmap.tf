resource "aws_s3_bucket" "minecraft_together" {
  bucket = "acas-minecraft-server-worldmap"

  tags = {
    Name        = "acas-minecraft-server-worldmap"
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_user" "minecraft_together" {
  name = "minecraft-together"

  tags = {
    Name        = "minecraft-together"
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_user_policy" "minecraft_together" {
  name = "acas-minecraft-server-together"
  user = aws_iam_user.minecraft_together.name

  policy = data.aws_iam_policy_document.minecraft_together_user.json
}

resource "aws_iam_access_key" "minecraft_together" {
  user = aws_iam_user.gitlab_backup.name
}

output "minecraft_together_credentials" {
  value = {
    access_key = aws_iam_access_key.minecraft_together.id
    secret_key = aws_iam_access_key.minecraft_together.secret
  }
  sensitive = true
}

data "aws_iam_policy_document" "minecraft_together_user" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = [
      "s3:AbortMultipartUpload",
      "s3:ListBucketMultipartUploads",
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.minecraft_together.arn,
      "${aws_s3_bucket.minecraft_together.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_website_configuration" "minecraft_together" {
  bucket = aws_s3_bucket.minecraft_together.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "images/blank.png"
  }
}

resource "aws_s3_bucket_acl" "minecraft_together" {
  bucket = aws_s3_bucket.minecraft_together.bucket

  acl = "public-read"
}

resource "aws_s3_bucket_policy" "minecraft_together" {
  bucket = aws_s3_bucket.minecraft_together.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.minecraft_together.arn,
          "${aws_s3_bucket.minecraft_together.arn}/*",
        ]
      },
    ]
  })
}

output "minecraft_together_bucket_website_endpoint" {
  value = aws_s3_bucket_website_configuration.minecraft_together.website_endpoint
}
