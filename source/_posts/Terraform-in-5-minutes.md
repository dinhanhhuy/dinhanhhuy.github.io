---
title: Terraform in 5 minutes
date: 2023-05-24 12:01:36
tags: [terraform]
---
> Terraform is a tool help user define infrastructure as code (IAC).
## Fundamental - All tiers features
### Create cloud resource
![](images/terraform-in-5-minutes/tfc-flow.png)
<p style="text-align: center;">Terraform architecture</p>

* developer: I need to create an ec2. 
  <script src="https://gist.github.com/dinhanhhuy/246a7424d3c033414528a4fb992e6d70.js"></script>
* developer: \*press enter\* Do it! (1)
  <script src="https://gist.github.com/dinhanhhuy/9a435a8a156022a106b6247c04afa296.js"></script>
* terraform: call AWS API to create a new EC2 instance (2)
  <script src="https://gist.github.com/dinhanhhuy/dc9537cc4d750b395308a448d9411e55.js"></script>
* terraform: write that down, state! (3)
  <script src="https://gist.github.com/dinhanhhuy/eeb8feebad0b4eae1bddcd5abb89861a.js"></script>

### Detect config driff
* other dude using aws console: what is this ec2? rename it!
  <script src="https://gist.github.com/dinhanhhuy/0ceb3d1a7d68229b337a4365d59e5fe0.js"></script>
* terraform: compare aws live data with state to check if anything still good
  <script src="https://gist.github.com/dinhanhhuy/7b464880cd44530b5a605d4812c66446.js"></script>
  Ops, some one changed something, do you want me revert?
## Terraform Enterprise & Cloud features
### Policy as code - Sentinel
- intern dude: \*panic\* some one updated the network ACL allow access from IP range 0.0.0.0/0!
- senior dude: use sentinel to prevent that happen again?
  <script src="https://gist.github.com/dinhanhhuy/19b23d2e7ab9ada1afffa35b5d388f4e.js"></script>

### Cost estimation
- senior dude: @intern dude, we gonna bankrupt if you push this!
  <script src="https://gist.github.com/dinhanhhuy/556500d92ef12ea201a52543ff2e8c40.js"></script>
- senior dude: \*muttered\* gonna create sentiel rule to limit cost of this project.
### The GUI
- intern dude: \*panic\* i never touch the terminal before in my life
- senior dude: this may help
  ![](images/terraform-in-5-minutes/tr-cloud.png)
## 5 minute already!
Terraform is a great tool with a lot of features & and a lot of bugs [(1,698 open/18,245 closed)](https://github.com/hashicorp/terraform/issues). Find out more about <i class="fa fa-tag"></i> [terraform](http://whiteballs.tech/tags/terraform/)!