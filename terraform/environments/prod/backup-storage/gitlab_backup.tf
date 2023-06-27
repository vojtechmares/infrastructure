resource "aws_s3_bucket" "gitlab_backup" {
  bucket = "mareshq-gitlab-backup"

  tags = {
    Name        = "mareshq-gitlab-backup"
    Environment = "production"
    ManagedBy   = "Terraform"
    For         = "gitlab.mareshq.com"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "gitlab_backup" {
  bucket = aws_s3_bucket.gitlab_backup.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_iam_user" "gitlab_backup" {
  name = "mareshq-gitlab-backup"

  tags = {
    Name        = "gitlab-backup"
    Environment = "production"
    ManagedBy   = "Terraform"
    For         = "gitlab.mareshq.com"
  }
}

resource "aws_iam_user_policy" "gitlab_backup" {
  name = "mareshq-gitlab-backup"
  user = aws_iam_user.gitlab_backup.name

  policy = data.aws_iam_policy_document.gitlab_backup.json
}

resource "aws_iam_access_key" "gitlab_backup" {
  user = aws_iam_user.gitlab_backup.name
}

output "gitlab_backup_credentials" {
  value = {
    access_key = aws_iam_access_key.gitlab_backup.id
    secret_key = aws_iam_access_key.gitlab_backup.secret
  }
  sensitive = true
}

data "aws_iam_policy_document" "gitlab_backup" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:ListBucketMultipartUploads",
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]
    resources = ["arn:aws:s3:::mareshq-gitlab-backup/*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetBucketLocation",
      "s3:ListAllMyBuckets"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket"
    ]
    resources = ["arn:aws:s3:::mareshq-gitlab-backup"]
  }
}
