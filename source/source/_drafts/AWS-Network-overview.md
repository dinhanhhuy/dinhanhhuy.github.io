---
title: AWS Network overview
tags:
---

internet -> application

internet 
  -> GW (API Gateway) 
  -> Nat instance (PA VM)
  -> Transit GW
  -> App

app -> app

app
  -> Transit GW
  -> PA VM

https://www.paloaltonetworks.com/apps/pan/public/downloadResource?pagePath=/content/pan/en_US/resources/guides/aws-transit-gateway-deployment-guide
page 22
