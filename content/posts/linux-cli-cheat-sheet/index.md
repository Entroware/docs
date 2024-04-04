---
title: "Linux Command Line Cheat Sheet"
date: 2024-03-21
description: "A handy cheat sheet for commonly used Linux command line commands."
summary: "This cheat sheet provides a quick reference for essential Linux command line commands, covering basic operations for file management, navigation, system administration, and more."
tags: ['Linux', 'Command Line', 'CLI', 'Cheat Sheet']
aliases:
  - /linux-cli-cheat-sheet/
---
## Introduction
The Linux command line is the most powerful way to interface with your system, providing you with options and flexibility that may not be available in a GUI. Becoming proficient with the CLI (Command Line Interface) will enable you to do more with your computer. This cheat sheet is designed to provide a reference for users who are new to the command line and if you would like to learn more about a particular command and its usage, users are encouraged to utilise the `man` command to review the command's manual page e.g. `man ls` and **q** to exit.

## File Management
| Command | Description |
|---|---|
| **ls** | List files and directories. |
| **pwd** | Print the current working directory. |
| **cd** | Change directory. |
| **mkdir** | Create a new directory. |
| **touch** | Create a new file. |
| **cp** | Copy files and directories. |
| **mv** | Move or rename files and directories. |
| **rm** | Remove files and directories. |
| **cat** | Display the contents of a file. |
| **less** | View the contents of a file interactively. |
| **head** | Display the beginning of a file. |
| **tail** | Display the end of a file. |

## Navigation
| Command | Description |
|---|---|
| **.** | Represents the current directory. |
| **..** | Represents the parent directory. |
| **-** | Represents the previous directory. |
| **~** | Represents the user's home directory. |

| Example| Description |
|---|---|
| **cd ..** | Change to parent directory. |
| **ls ~** | List files and directories in the home directory. |

## System Information
| Command | Description |
|---|---|
| **uname** | Display system information. |
| **hostname** | Display the system's hostname. |
| **whoami** | Display the current user. |
| **date** | Display the current date and time. |
| **uptime** | Display system uptime. |

## Process Management
| Command | Description |
|---|---|
| **ps** | Display information about running processes. |
| **top** | Display dynamic real-time information about running processes. |
| **kill** | Terminate a process by PID. |
| **killall** | Terminate all processes by name. |

## Package Management
| Command | Description |
|---|---|
| **apt** & **apt-get** | Package management utility for Ubuntu/Debian-based systems. |
| **yum** | Package management utility for Red Hat-based systems. |
| **dnf** | Package management utility for Fedora-based systems. |
| **snap** | Package management utility for multiple Linux systems. |
| **flatpak** | Package management utility for multiple Linux systems. |

## Network
| Command | Description |
|---|---|
| **ping** | Send ICMP echo requests to a network host. |
| **ip** | Display and configure network interfaces. |
| **ss** | Display network connections. |
| **wget** & **curl** | Retrieve files from the internet. |

## File Permissions
| Command | Description |
|---|---|
| **chmod** | Change file permissions. |
| **chown** | Change file owner and group. |
| **chgrp** | Change group ownership of files. |

## Text Processing
| Command | Description |
|---|---|
| **grep** | Search for patterns in files. |
| **sed** | Used for filtering and transforming text. |
| **awk** | Pattern scanning and processing tool. |

## Compression and Archiving
| Command | Description |
|---|---|
| **tar** | Create, manipulate, or extract tar archives. |
| **gzip** | Compress or decompress files using gzip compression. |
| **zip** | Compress or decompress files using zip compression. |

## Miscellaneous
| Command | Description |
|---|---|
| **echo** | Print text to the terminal. |
| **clear** | Clear the terminal screen. |
| **history** | Display command history. |
| **man** | Display the manual page for a command. |
| **sudo** | Execute a command as a superuser (root). |

## Conclusion

This cheat sheet provides a quick reference for commonly used Linux command line commands. Keep it handy for quick access to essential commands for file management, navigation, system administration, and more. Experiment with these commands in a Linux terminal to enhance your proficiency and productivity on the command line.
