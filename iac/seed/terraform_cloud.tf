terraform {
  required_providers {
    tfe = {
      version = "~> 0.46.0"
    }
  }
}

data "tfe_organization" "whiteballs" {
  name = "whiteballs"
}

resource "tfe_project" "cloud_blog" {
  organization = data.tfe_organization.whiteballs.name
  name         = "whiteballs-tech"
}

resource "tfe_workspace" "whiteballs_tech" {
  name         = "whiteballs-tech"
  organization = data.tfe_organization.whiteballs.name
  project_id   = tfe_project.cloud_blog.id
  tag_names    = ["prod"]
}

resource "tfe_variable" "aws_iam_access_key" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = aws_iam_access_key.tfc_cloud_blog.id
  category     = "env"
  workspace_id = tfe_workspace.whiteballs_tech.id
  description  = "iam user: whiteball.aws/iam:tfc-cloud-blog"
}

resource "tfe_variable" "aws_iam_secret_key" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = aws_iam_access_key.tfc_cloud_blog.ses_smtp_password_v4
  sensitive    = true
  category     = "env"
  workspace_id = tfe_workspace.whiteballs_tech.id
  description  = "iam user: whiteball.aws/iam:tfc-cloud-blog"
}

resource "tfe_variable" "aws_region" {
  key          = "AWS_DEFAULT_REGION"
  value        = "ap-southeast-1"
  category     = "env"
  workspace_id = tfe_workspace.whiteballs_tech.id
}
