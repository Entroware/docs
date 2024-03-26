---
title: "Configuring Network Settings in Ubuntu Server: Basics and Troubleshooting"
date: 2024-03-21
description: "Learn how to configure network settings in Ubuntu Server using Netplan and perform basic troubleshooting."
summary: "This article provides a guide to configuring network settings in Ubuntu Server, covering basic configuration tasks such as setting up IP addresses, DNS, and network interfaces, as well as troubleshooting steps for resolving common networking problems."
tags: ['Ubuntu Server', 'Linux', 'Networking', 'Configuration', 'Troubleshooting']
aliases:
  - /ubuntu-server-network-configuration/
---

## Introduction to Network Configuration on Ubuntu Server

Configuring network settings for a server is essential for successful operation. This article covers basic network configuration using Netplan and troubleshooting steps to resolve common networking issues.


### Basic Network Configuration

#### 1. Checking your interface information

Use the following command to check the status of available network interfaces:

```bash
user@machine:~$ ip addr
```

In our example output it shows two network interfaces, the system loopback `lo` and our `enp0s3` interface.

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:1b:21:00:00:00 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.10/24 brd 192.168.1.255 scope global dynamic noprefixroute enp0s3
       valid_lft 6077sec preferred_lft 6077sec
    inet6 fe80::1c68:8197:5a52:f1b2/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
```



#### 2. Finding your Netplan Configuration

Your Netplan configuration will be located in the `/etc/netplan/` directory. The filename may differ, however this can be checked using the following command:

```bash
user@machine:~$ ls /etc/netplan/
```

When you have found it, open it in your favourite text editor but remember to use `sudo` as this file will need root privileges.

```bash
user@machine:~$ sudo nano /etc/netplan/01-netcfg.yaml
```


#### 3. Examples of a Netplan Configuration

Here is an example that configures DHCP for IPv4 on the `enp0s3` network interface.

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: true
```

Here is an example that configures a static IPv4 address, subnet, default route, and two DNS servers on the `enp0s3` network interface.

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: false
      addresses:
        - 192.168.1.100/24
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
        addresses:
          - 8.8.8.8
          - 8.8.4.4
```


#### 4. Apply the changes

To apply the changes without rebooting just run the following:

```bash
user@machine:~$ sudo netplan apply
```

If the configuration does not work as intended you can get more information with the following:

```bash
user@machine:~$ sudo netplan --debug apply
```



### Troubleshooting Networking Issues

#### 1. Checking Network Connectivity

To verify network connectivity you can use the `ping` command.  If the following is successful, it indicates that your system is able to connect out:

```bash
user@machine:~$ ping 8.8.8.8
```

However if the next command is successful, it indicates that your system is able to connect out as well as being able to resolve DNS queries.

```bash
user@machine:~$ ping google.com
```



### Conclusion

Configuring network settings in Ubuntu Server is essential for connectivity and accessing resources on a network. By following these basic configuration steps and troubleshooting techniques outlined in this article, you can effectively set up and troubleshoot basic network connections on your Ubuntu Server system.
