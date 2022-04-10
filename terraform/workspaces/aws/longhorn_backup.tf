resource "aws_s3_bucket" "ant_longhorn_backup" {
  bucket = "ant-longhorn-backup"

  tags = {
    Name        = "ant-longhorn-backup"
    Environment = "production"
    ManagedBy   = "Terraform"
    For         = "longhorn.ant.k8s.vxm.cz"
  }
}

resource "aws_iam_user" "ant_longhorn_backup" {
  name = "ant-longhorn-backup"

  tags = {
    Name        = "ant-longhorn-backup"
    Environment = "production"
    ManagedBy   = "Terraform"
    For         = "longhorn.ant.k8s.vxm.cz"
  }
}

resource "aws_iam_user_policy" "ant_longhorn_backup" {
  name = "ant-longhorn-backup"
  user = aws_iam_user.ant_longhorn_backup.name

  policy = data.aws_iam_policy_document.ant_longhorn_backup.json
}

resource "aws_iam_access_key" "ant_longhorn_backup" {
  user = aws_iam_user.ant_longhorn_backup.name
}

output "ant_longhorn_backup_credentials" {
  value = {
    access_key = aws_iam_access_key.ant_longhorn_backup.id
    secret_key = aws_iam_access_key.ant_longhorn_backup.secret
  }
  sensitive = true
}

data "aws_iam_policy_document" "ant_longhorn_backup" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:DeleteObject",
    ]
    resources = [
      "arn:aws:s3:::ant-longhorn-backup",
      "arn:aws:s3:::ant-longhorn-backup/*",
    ]
  }
}
