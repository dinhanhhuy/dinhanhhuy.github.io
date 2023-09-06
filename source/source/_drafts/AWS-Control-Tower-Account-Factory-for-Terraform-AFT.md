---
title: AWS Control Tower Account Factory for Terraform (AFT)
tags:
---
> AWS Control Tower Account Factory for Terraform (AFT) adopts a GitOps model that automates the process of account provisioning and updating in AWS Control Tower.

## Why AFT?
### Core component
AFT core component include 4 git repo & Terraform
- git 1: request/delete AWS account
- git 2: control define a set of terraform resources in all accounts
- git 3: control define a set of terraform resource in some account (group)
- git 4: control non-terraform resource (we ignore this dude)

### Use case
- define all AWS account need created a budget alert (git 2)
- define PRODUCTION group will create additional guardrail using AWS Config Rule to detect if VPC Flow Logs is enabled. (git 3)
- define SANDBOX group we will setup monthly budget of $100 (git 3)
- create new users and test those rule (git 1)

## How it work
- AFT create a big `blackbox` that we don't dare to talk about. We just need understand: download a public terraform module and run apply :D
- When trigger push to git-xxx do xxx
- ...
- ...

## Compare other solutions
- terragrunt
  - request/delete AWS account
  - control define a set of terraform resources in all accounts
  - control define a set of terraform resource in some account (group)
  - control non-terraform account

## Summary
- 477 start ~= 104 open + 244 closed issue with 306 fork :D. [This guy](github.com/aws-ia/terraform-aws-control_tower_account_factory) still rolling in the bug