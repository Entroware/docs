---
title: "Setting Up SSH and Using SSH Keys on Ubuntu"
date: 2024-03-21
description: "Learn how to set up SSH (Secure Shell) and use SSH keys for secure authentication on Ubuntu."
summary: "This guide provides step-by-step instructions for setting up SSH (Secure Shell) and configuring SSH keys for secure authentication on Ubuntu, enhancing security and convenience for remote access."
tags: ['Ubuntu', 'SSH', 'SSH Keys', 'Authentication', 'Security']
aliases:
  - /ubuntu-ssh-keys-setup/
---

## Introduction to SSH and SSH Keys

SSH (Secure Shell) is a cryptographic network protocol that provides secure access to a remote system. SSH keys offer a more secure way to authenticate compared to traditional password authentication.


## SSH Client

Here we will show you how to setup an OpenSSH client which will allow you to connect to an existing server with SSH enabled.

### 1. Install OpenSSH Client

The OpenSSH client package provides the necessary tools for connecting to SSH servers. Install it using the following command:

```bash
user@machine:~$ sudo apt install openssh-client
```

### 2. Generate SSH Key Pair

You can now generate an SSH key pair using the `ssh-keygen` command. The following command will create a public/private key pair with a comment that includes your username, hostname, and current date:

```bash
user@machine:~$ ssh-keygen -C "$(whoami)@$(hostname) $(date -I)"
```

Follow the prompts to specify a location to store the generated keys, by default this would be `~/.ssh/`. It will also ask you to optionally set a passphrase for added security, this is something that we **would** recommend.  This password is used to protect the private key you just generated and would be used to unlock the private key when you want to use it, this password would never be sent to a SSH server.

### 3. Copy Public Key to Server

Now that the SSH key pair is generated, copy the public key to your Ubuntu server using the `ssh-copy-id` command:

```bash
user@machine:~$ ssh-copy-id user@server
```

Replace `user` with your server username and `server` with the IP address or hostname of your SSH server. You will be prompted to enter your server password for authentication, however once it completes you will then be able to use the newly generated keys instead for authentication.



### 4. Test SSH Key Authentication

You can now test SSH key authentication by attempting to SSH into your server:

```bash
user@machine:~$ ssh user@server
```

If SSH key authentication is configured correctly.



## SSH Server

Here we will show you how to setup an OpenSSH server, this would be used if you plan on setting up a system that you want to be able to connect to via SSH. 


### 1. Install OpenSSH Server

The OpenSSH server package provides the necessary components for SSH server functionality.  Install it using the following command:

```bash
user@server:~$ sudo apt install openssh-server
```


### 2. Configure SSH on Server

Ensure that SSH key authentication is enabled in the SSH server configuration file `/etc/ssh/sshd_config` and verify that the following options are set:

- **PubkeyAuthentication**: Should be set to `yes` to enable public key authentication.
- **PasswordAuthentication**: It's recommended to set this to `no` to disable password authentication and enforce key-based authentication.

Finally restart the SSH service after making these changes to the configuration file:

```bash
user@server:~$ sudo systemctl restart ssh
```


### Conclusion

You have successfully set up SSH and configured SSH keys for secure authentication on your Ubuntu server. SSH keys offer a secure and convenient way to authenticate without needing to enter passwords, enhancing security and convenience for remote access. Make sure to keep your private SSH key secure and never share it with unauthorised individuals.
