---
title: "Create and use a Memtest86 USB Drive in Ubuntu"
date: 2024-04-03
description: "Using Memtest86 to test your system's memory."
summary: "This article explains how to create a memtest86 bootable USB drive in Ubuntu and boot into it to test the integrity of the memory in your system."
tags: ['memtest', 'memtest86', 'bootable', 'USB', 'Linux', 'Ubuntu']
aliases: 
  - /memtest86/
---

## Introduction to Memtest86

Memtest86 is a tool used to diagnose issues with memory (RAM). It is not a part of the operating system and must be booted into to perform a test. Testing memory is a very important diagnostic step when the user is experiencing errant behaviour from their computer, because memory failures can manifest in completely erratic and unpredictable ways which may make other tests impossible. This guide will teach you how to create a bootable Memtest86 USB drive and use it to test your computer's memory.

### Getting Started

To create a Memtest86 bootable USB drive, you will need:
1. USB Drive: Minimum 2GB capacity recommended
2. Memtest86 Image: Downloaded from the memtest86 website

To download the image, go to www.memtest86.com/download.htm

#### UEFI systems:
Download Memtest86 Free from the top of the page.
![UEFI memtest download link](images/memtest-uefi-download.jpg)

#### Legacy systems:
Scroll down to Older Versions, under the *V4 Linux/Mac Downloads* heading, download the *Image for creating bootable USB Drive*.
![Legacy BIOS memtest download link](images/memtest-legacy-download.jpg)

### Extract Memtest86 USB disk image

Open the newly downloaded `memtest86-usb.zip` zip file and extract the `memtest86-usb.img` file from the archive.  This file will be used in the next step.

### Creating a bootable Memtest86 USB drive

1. Open the Disks application and select your USB drive from the side menu. 
![Select USB drive](images/memtest-drive-0.jpg)
2. Click on the three dots once again and select `Restore Disk Image...`
![Click the three dots and select Restore Image...](images/memtest-drive-1.png)
3. Under Image to Restore, choose the extracted 'memstest86-usb.img' from earlier and click `Start Restoring...`
![Select USB drive](images/memtest-drive-2.png)

Click `Restore` on the next window to finish imaging the drive.

Finally, shut down your system to proceed to the next stage.

### Using Memtest86

1. Ensure AC is connected, power machine on and press your boot key (F7 on Entroware laptops, F8 or F12 on Entroware desktops). 
From the boot menu, select the removable drive and press enter.
![Boot select](images/memtest-0.png)

2. Once memtest86 has loaded, select 'Config'
![Select config](images/memtest-3.png)

3. To begin testing your system's memory, select the 'Start Test' option on the left.
![Start Test](images/memtest-4.png)

4. Memtest86 will now thoroughly test the memory installed in your computer. This may take many hours to complete depending on many variables, but will provide crucial insight into the condition of your memory modules.
![Allow the test to run](images/memtest-5.png)

5. Once the test has been completed, you will be prompted to press any key to view the results.
![Press any key to see the results once the memtest has been completed.](images/memtest-6.png)

6. Memtest86 will then display the number of errors that have been found (if any). You will also be asked if you wish to save a report to a file on the USB drive, select 'y'.
![Your results will then be displayed](images/memtest-7.png)

### Conclusion
This article has guided you through the creation and use of a memtest86 usb drive to test the memory modules in your computer.  If you find memory errors and are within warranty or have an SLA, contact us for memory replacement options. If you are self-servicing, have suitable experience and have taken the proper precautions, ensure the failing memory module(s) have been properly identified in multi module setups by rerunning the test with each module removed.
