---
title: Debug Kubernetes Pod in 5 minutes
date: 2023-07-20 17:58:40
tags: [kubernetes, linux]
---
> While there's Code There's Bug
![](images/debug-k8s/debug-1.png)
## All the kind of bug
### bash: netstat: command not found
* intern dude: \*panic\* help! production containers are running but not responding!
* senior dude: \*sigh\* check if the port is up and the application is running on 0.0.0.0 using `netstat` cli
* intern dude: i can't `kubectl exec ...` to the pod, it's alway return the error `bash: netstat: command not found`
* senior dude: go check the pod directly on the node.
* intern dude: \*after ssh to the node\* i can't `docker exec c84ad4878642 netstat -lnpt`, it return the same error!
* senior dude: Yeah, how can it don't return the same error? Using the netstat cli to debug the network namespace of pod!
* intern dude: ... the what?
* senior dude: ... ok, you [read this](http://whiteballs.tech/2023/07/18/Create-another-docker-engine/) and let me check the issue.

\*5 minutes later\*

* senior dude: ok found it, the application is listen on 127.0.0.1 instead of 0.0.0.0.
* intern dude: HOW???
* senior dude: \*sigh\* read the [previous link](http://whiteballs.tech/2023/07/18/Create-another-docker-engine/) first and i will explain the rest for you. because the storage namespace of pod don't have the `netstat` cli so you can't use that command when execute to the pod.
  ![](images/debug-k8s/debug-2.png)
  <p style="text-align: center;">Pod is mapping to storage & network namespace</p>
* senior dude: To check the network of pod we need access to the pod's network namespace. And after that, we need using the `netstat` cli on k8s node to debug the network inside that namespace.
  ![](images/debug-k8s/debug-3.png)
* senior dude: first you need to find the real pid id of that container
  <script src="https://gist.github.com/dinhanhhuy/a54400ddc7062494c3518ced9f9f5e15.js"></script>
  and then you can find all the linux namespace attached to that pid id
  <script src="https://gist.github.com/dinhanhhuy/24c59722542a96a0441897bf8b823f1d.js"></script>
  network namespace is kind of special so you need do some more work to find it
  <script src="https://gist.github.com/dinhanhhuy/45c7cfae4b197237cc372dc3dea0f534.js"></script>
  after that, you can use any debug tool installed on k8s node to debug the container network namespace
  <script src="https://gist.github.com/dinhanhhuy/bc6ba38653cc1cbd1f6237c0d99c37d8.js"></script>
* intern dude: ... so this is similar when i have the error `/bin/sh not found`?
* senior dude: yes, because that pod's storage namespace don't have `sh`. Remember, 1 linux namespace can attached to many process and that give us a lot of power.