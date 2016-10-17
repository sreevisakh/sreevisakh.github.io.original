---
layout : post
title : Install 4G dongle in ubuntu
comments : true
---

### Problem

You have a 3G/4G dongle from Airtel/Idea etc, and you are a fan of ubuntu. Sometimes when you install the software ubuntu will not detect the dongle. Sometimes ubuntu will not show Mobile Broadband Connection In the network menu.

### Solution

#### 1. Wait

It takes a bit time to enable dongle in ubuntu. So waiting for it to initialise fully will be a good idea, Normally when a hardware is connected system will make a beep sound.  But if you are not ptient enough, you can check the logs for what is happening.

```shell
tail -f /var/log/*
```

The above command will print every log in the system.  Check the log to see logs like the following

`usb device`, `mode_switch`,`searching`	etc. It means it is detected and initiliasing.



#### 2. Install Software

Every dongle comes with its software. It will be normally available as a CD drive when you connect the dongle.

If you are not seeing the CD drive, Check for a device with the name `/dev/sr0`

>  ```sh
>  ls /dev/sr0
>  ```
>
>  I have faced with problem multiple times, This CD drive some how gets corrupted, and will not be able to access that 

it is there, make a copy of it into your computer

```sh
sudo dd if=/dev/sr0 of=/home/username/dongle.iso
```

this will copy the content of the dongle cd drive to dongle.iso file. Mount it and open it

give permission to all the executable files

```sh
chmod +x install_linux Linux/install
```

exuecte install_linux

```sh
./install_linux
```



it will open a small terminal, type yes and it will install the software. 

> if it throws error, install build-essentials
>
> ```sh
> sudo apt install build-essentials
> ```
>
> 













