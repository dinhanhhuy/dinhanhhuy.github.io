provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_iam_user" "tfc_cloud_blog" {
  name = "tfc-cloud-blog"

  tags = {
    env     = "prod"
    project = "cloud-blog"
  }
}

resource "aws_iam_access_key" "tfc_cloud_blog" {
  user = aws_iam_user.tfc_cloud_blog.name
}

resource "aws_iam_user_policy" "tfc_cloud_blog" {
  name = "tfc-cloud-blog"
  user = aws_iam_user.tfc_cloud_blog.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowAllEC2Actions",
      "Action": [
        "ec2:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

output "aws_iam_smtp_password_v4" {
  value     = aws_iam_access_key.tfc_cloud_blog.ses_smtp_password_v4
  sensitive = true
}
