---
title: Create another Docker engine in 5 minute
date: 2023-07-18 17:57:30
tags: [docker, linux]
---
> This blog explain how Docker work under the hood and from that we create a new similar tool.
![](images/mocker/mocker-thumb.png)

## What we cover here?
* Storage binding - mapping the storage from physical host to container
* Network mapping - mapping the network from container to physical host
* Container image - split container image to a lot of reusable layer

### Storage binding
Docker don't create thing out of thin air. Most of it's magic is depends on [Linux namespace](https://en.wikipedia.org/wiki/Linux_namespaces). Mount namespace allows us to create a simulated, isolated storage space that other processes can use.

Here we create a new storage namespace so we can map it to our container later.
<script src="https://gist.github.com/dinhanhhuy/b36e7e5e7aaf12f5262b82404085a5ae.js"></script>

### Network mapping
Similar with Storage binding, we create our network namespace with id "some-sql"
<script src="https://gist.github.com/dinhanhhuy/f2b21fcc305bd3b53f9085441ff94e31.js"></script>
To allow the MySQL instances running in the network namespaces can be access from the host, we will do the [network bridge here](https://github.com/zalopay-oss/mocker-k1s/blob/mocker-v1.0.0/mocker/network.sh#L18). However, for the sake of our sanity, we will simply accept it as it is.

### Container image
This feature don't involve to Linux namespace. For each line of Dockerfile, we [hash the command string](https://github.com/zalopay-oss/mocker-k1s/blob/275d98f8474da4f789f1c8f569f56595f16fb114/mocker/mockerfile.sh#L4) to create the unique layer ID. If the layer already exist, we using cache instead of execute the build command

![](images/mocker/hash.png)
<p style="text-align: center;">Calculate hash id of image layer</p>

\* When start a new container, we simply copy all the files in the layer folder to the container storage namespace.

## Our new engine 
Start new sql process and attachs it to network & mount namespace we have the final container
![](images/mocker/mocker.png)
<p style="text-align: center;">Start new process attached to 2 namespaces</p>
Demo of our new engine on Linux server without Docker installed
<script async id="asciicast-uUOjoz0e0oFdWdzFbljZfUATn" src="https://asciinema.org/a/uUOjoz0e0oFdWdzFbljZfUATn.js"></script>

For source code & setup guidelines [come here](https://github.com/zalopay-oss/mocker-k1s)



