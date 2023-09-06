terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "whiteballs"

    workspaces {
      name = "whiteballs-tech"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

output "hello_world" {
  value     = "hello world"
}