---
title: "Understanding the Linux Filesystem Hierarchy"
date: 2024-03-21
description: "An overview of the Linux filesystem hierarchy."
summary: "This article explains the Linux Filesystem Hierarchy Standard (FHS) which defines the structure and organisation of directories in Linux systems, providing insights into the purpose of each directory."
tags: ['Linux', 'Filesystem', 'Hierarchy', 'FHS']
aliases:
  - /linux-filesystem-hierarchy/
---

## Introduction to the Linux Filesystem Hierarchy

The Linux Filesystem Hierarchy Standard (FHS) defines the structure and organisation of directories in Linux systems. Understanding the filesystem hierarchy is essential for efficient navigation, administration, and management of Linux systems.

### Root Directory (/)

The root directory is the top-level directory in the filesystem hierarchy. It is represented by a single forward slash (/) and serves as the starting point for all other directories. In Linux, everything is organized under the root directory.

### Important Directories

Here are some key directories defined by the FHS and their purposes:

- `/bin`: Contains essential binary executables (commands) required for system boot and operation, accessible to all users.
- `/boot`: Contains boot loader files, kernel images, and other files required for system booting.
- `/dev`: Contains device files representing hardware devices and system peripherals.
- `/etc`: Contains system-wide configuration files and directories.
- `/home`: Home directories for regular users are located here.
- `/lib` and `/lib64`: Essential Libraries for other installed binaries.
- `/media`: Mount point for removable media such as USB drives and optical discs.
- `/mnt`: Temporary mount point for filesystems.
- `/opt`: Contains optional software packages installed by user.
- `/proc`: A virtual filesystem that provides information about processes and system resources.
- `/root`: Home directory for the root user.
- `/sbin`: Contains system binaries (commands) used for system administration tasks.
- `/srv`: Contains data for services provided by the system.
- `/sys`: Contains information regarding components, drivers, and kernel features.
- `/tmp`: Directory for temporary files that will be deleted on system reboot.
- `/usr`: Contains user-related binaries, libraries, documentation, and more.
- `/var`: Contains variable data files, including logs, spool files, and temporary files.

### Conclusion

Understanding the Linux Filesystem Hierarchy is crucial for effectively navigating, administering, and managing Linux systems. By familiarising yourself with the purpose of each directory, you can better organize your files, configure system settings, and troubleshoot issues when necessary. Refer to the Linux Filesystem Hierarchy Standard documentation for further details and guidelines.
