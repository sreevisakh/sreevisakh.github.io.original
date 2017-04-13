---
title: 'Setting static ip address for raspberry pi'
layout: post
tags:
  - pi
  - ' staticip'
  - ' dhcp'
  - ' ssh'
category: 'Raspberry Pi'
---

  When you add raspberry pi to your network it is essential that you should be able to ssh in to the pi.  This can be difficult if the ip address changes everytime pi reboots.  One way to solve the problem is setting a static ip address for your pi.

  Normally ip address are assigned dynamically by your router. So that pi will get a random ip address every time it connects to the network from an ip pool.  This is done with the help of a DHCP server and client.
  
  The information about your network interfaces are in the following file.
  `/etc/interfaces`
The above files have information about what all different net work devices
if you have lan connection it will be denoted by eth0 (mostly) & wifi will wlan0.  You can modify this information to assign static ip to pi.

change the above file content after wlan0 as follows (if you are using pi wifi to connect to net otherwise choose eth0)

```sh
iface wlan0 inet static
    address 192.168.1.1
    netmask 255.255.255.0
    gateway 192.168.1.1
    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
```

Now the address, netmask, gateway varies with network.  Normal home broaband connection will have something similar to above.
you can run `ifconfig` it will show you these information 

in the output you can see gateway & subnet, for the address, select one address in that subnet (mostly if gateway is 192.168.1.1 address can be in 192.168.1.2 - 192.168.1.254)

reboot your pi it will have static ip you can connect.


