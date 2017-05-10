---
layout: post
title: Running nodejs on port 80
comments : true
category : 'javascript'
---

If you are familiar with network ports, ports below 1024 are reserved port for
system application. In ubuntu we will not be able to use those ports for our appllication in standard user mode.
One way to use them is to run it as root user with the help of `sudo`. But which will open our application to the world
with root access to the server which will cause serious security issue.

### Non Root Port Binding

This is another way to bind our application to ports less than 1024 without `sudo`.  execute the following command for this.

{% highlight bash %}
sudo setcap cap_net_bind_service=+ep `which node`
{% endhighlight %}

if you get an error that setcap not found install it with the following command

{% highlight bash %}
sudo apt-get install libcap2-bin
{% endhighlight %}

this will help our node binary to bind to reserved ports wihout root. Now if you start your app with port 80 it will not give
you `EACCESS` error.
