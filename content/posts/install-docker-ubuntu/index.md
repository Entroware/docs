---
title: "Install Docker on Ubuntu"
date: 2024-04-04
description: "A step-by-step guide on how to install Docker on Ubuntu"
summary: "This guide will walk you through how to install Docker on Ubuntu without needing the sudo command to run it."
tags: ['Linux', 'Docker', 'Ubuntu', 'Install']
aliases:
  - /install-docker-ubuntu/
---
## Introduction
Docker is a container platform designed to make running and setting up applications an easy and consistent experience, regardless of which environment you are using. Docker features a rich ecosystem of container images, which are all ready for you to install and use.

## Install Docker
Firstly, ensure the `curl` package is installed with
```bash
user@machine:~$ sudo apt install curl
```
### Add Docker keys and repository
Add Docker's official GPG keys for Ubuntu
```bash
user@machine:~$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
Then add the Docker repository
```bash
user@machine:~$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
```
Update your package list
```bash
user@machine:~$ sudo apt update
```
### Install the Docker package
Install the Docker package
```bash
user@machine:~$ sudo apt install docker-ce
```
### Add user to group
Add your user to the docker group. This will prevent the need for root privileges each time you launch a docker container.
```bash
user@machine:~$ sudo usermod -aG docker ${USER}
```

Log out and back in for the new user groups to apply.

## Conclusion

You have now successfully installed Docker on Ubuntu and can explore the vast Docker ecosystem. If your Docker computer has NVIDIA graphics, remember to set up the NVIDIA container toolkit with our guide: [Configure docker for NVIDIA acceleration]({{< relref "configure-docker-nvidia" >}})
