---
title: "Setting Up LUKS Encryption on Ubuntu"
date: 2024-03-21
description: "Learn how to set up LUKS encryption on Ubuntu for enhanced security and data protection."
summary: "This guide provides step-by-step instructions for setting up LUKS (Linux Unified Key Setup) encryption on Ubuntu, ensuring that your data remains secure and protected against unauthorised access."
tags: ['Ubuntu', 'LUKS', 'Encryption', 'Security']
aliases:
  - /ubuntu-luks-encryption-setup/
---

## Introduction to LUKS Encryption

LUKS (Linux Unified Key Setup) is a disk encryption specification that provides a standard format for encrypting partitions on Linux. By encrypting your data with LUKS, you can ensure that it remains secure, even if your device is lost or stolen.

### 1. Install Required Packages

Before setting up LUKS encryption, ensure that the required packages are installed:

```bash
user@machine:~$ sudo apt install cryptsetup
```

### 2. Partitioning the Disk

If you haven't already done so, create the partition that you want to encrypt using a tool like `Disks` or a command line tool such as `fdisk` or `parted`.

Please note that this cannot be performed on your running Ubuntu storage device, only an additional storage device.  If disk encryption is required on the same disk as the running operating system, this would require Ubuntu to be reinstalled and disk encryption selected during installation.


### 3. Setting Up LUKS Encryption

Once the partition is created, you can set up LUKS encryption on it. Replace `/dev/nvme1n1p1` with your partition:

```bash
user@machine:~$ sudo cryptsetup luksFormat /dev/nvme1n1p1
```

You will be prompted to enter a passphrase. This passphrase will be used to unlock the encrypted partition.


### 4. Opening the Encrypted Partition

After formatting the partition with LUKS, open it using the following command:

```bash
user@machine:~$ sudo cryptsetup luksOpen /dev/nvme1n1p1 my-encrypted-partition
```

Replace `/dev/nvme1n1p1` with the path to your encrypted partition and `my-encrypted-partition` with a name of your choice.


### 5. Creating a File System

Once the encrypted partition is opened, you can create a file system on it. For example, to create an ext4 file system:

```bash
user@machine:~$ sudo mkfs.ext4 /dev/mapper/my-encrypted-partition
```

### 6. Mounting the Encrypted Partition

Create a mount point for the encrypted partition and mount it:

```bash
user@machine:~$ sudo mkdir /mnt/my-encrypted-partition
user@machine:~$ sudo mount /dev/mapper/my-encrypted-partition /mnt/my-encrypted-partition
```

### 7. Testing

To verify that the encrypted partition is working correctly, create a test file on it:

```bash
user@machine:~$ sudo touch /mnt/my-encrypted-partition/test-file
```

If you can create and access files on the encrypted partition without any issues, then the setup is successful.

### Conclusion

You have successfully set up a LUKS encrypted partition on your Ubuntu system. Your data on the encrypted partition is now protected with strong encryption, providing an additional layer of security against unauthorised access. Make sure to safely store your encryption passphrase in a secure location, as it will be required to unlock the encrypted partition whenever you need to access it.
