---
title: AWS Account Factory for Terraform in 5 minutes
date: 2023-07-21 13:07:34
tags: [aft, aws, terraform]
---
> AWS Account Factory for Terraform (AFT) is feature of Control Tower that allows you to customize new and existing AWS accounts when provision their resources
## Highlight features
AWS AFT include over 30 AWS services (lambda, dynamo, etc...) so we treat it as a big blackbox that we never understand and keep ignoring. The GitOps part where we need focus are only 4 AWS Commit repositories that hanndle the "Factory" process of AWS Account.

![](images/aft/AFT.png)
<p style="text-align: center;">GitOps provisioning resources for AWS account</p>

### Manage AWS accounts
The first repo [aft-account-request](https://github.com/aws-ia/terraform-aws-control_tower_account_factory/tree/main/sources/aft-customizations-repos/aft-account-request) that define the accounts as the following
<script src="https://gist.github.com/dinhanhhuy/93a6f5c6058206f810cd2c1b1d2a4c3d.js"></script>

### Provision TF resources in all accounts
This repo [aft-global-customizations](https://github.com/aws-ia/terraform-aws-control_tower_account_factory/tree/main/sources/aft-customizations-repos/aft-global-customizations) define resources that will be created in all AWS accounts. Example a policy that don't allow create S3 with public access in all accounts:
<script src="https://gist.github.com/dinhanhhuy/af03031015cc2810854f7e0535333df2.js"></script>

### Provision TF resources in customization group
This repo [aft-account-customizations](https://github.com/aws-ia/terraform-aws-control_tower_account_factory/tree/main/sources/aft-customizations-repos/aft-account-customizations) is a little tricky. It create resources for specific customizations group that map to a list of AWS accounts. We can see 2 folder `PRODUCTION` and `SANDBOX` represent for 2 customizations groups
<script src="https://gist.github.com/dinhanhhuy/4027f18c3f4048700ed4623e96e6a674.js"></script>
Any AWS account defined with attribute `account_customizations_name` equal to `SANDBOX` will have all resources in customizations groups `SANDBOX`
<script src="https://gist.github.com/dinhanhhuy/bf2f01f821bbfa75a746408c89ecc855.js"></script>
Ex: we can setup something like monthly budget of $100 in `SANDBOX/terraform/main.tf` for all AWS accounts in group `SANDBOX`

### The 4th repo
- intern dude: What about repo [aft-account-provisioning-customizations](https://github.com/aws-ia/terraform-aws-control_tower_account_factory/tree/main/sources/aft-customizations-repos/aft-account-provisioning-customizations)?
- senior dude: Hell know, AWS say "When you need to setup custom, non-Terraform integrations before you provision your account, these can be included in the provisioning customization". I never tested it my self so you can think it is one of your homework.
## Inside Blackbox
If you want to understand what really happens in AFT, come here and [take a peek](https://github.com/aws-ia/terraform-aws-control_tower_account_factory)