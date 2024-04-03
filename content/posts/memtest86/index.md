---
title: "Create and use a Memtest86 USB Drive in Ubuntu"
date: 2024-03-21
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

To download the image, go to www.memtest.com/download.htm 

#### UEFI systems:
Download Memtest86 Free from the top of the page.
![UEFI memtest download link](images/memtest_uefi_download.jpg)

#### Legacy systems:
Scroll down to Older Versions, under the *V4 Linux/Mac Downloads* heading, download the *Image for creating bootable USB Drive*.
![Legacy BIOS memtest download link](images/memtest_legacy_download.jpg)

Extract *memtest86-usb.img* from the archive

### Creating a bootable Memtest86 USB drive

1. Open the Disks application and select your USB drive from the side menu. 
![Select USB drive](images/memtest_drive_0.jpg)
2. Click on the three dots on the top right of the window and select `Format Disk...` 
![Click Format Disk...](images/memtest_drive_1.jpg)
3. Ensure MBR/DOS is selected in the Partitioning dropdown menu and click on `Format...` 
![Select MBR/DOS and click Format...](images/memtest_drive_2.png)
4. Click on `Format` to continue. 
![Confirm that you would like to continue](images/memtest_drive_3.png)
5. Click on the `+` icon to enter the Create Partition dialogue.
![Enter the Create Partition dialogue](images/memtest_drive_4.png)
6. Click next to proceed with the default partition size.
![Click next](images/memtest_drive_5.png)
7. Ensure FAT is selected and click on `Create`
![Select FAT and click Create](images/memtest_drive_6.png)
8. Click on the three dots once again and select `Restore Disk Image...`
![Click the three dots and select Retore Image...](images/memtest_drive_7.png)
9. Under Image to Restore, choose the extracted 'memstest86-usb.img' from earlier and click `Start Restoring...`
![Select USB drive](images/memtest_drive_8.png)


Finally, shut down your system to proceed to the next stage.

### Using Memtest86

1. Ensure AC is connected, power machine on and press boot key (F7 on Entroware laptops). 
From the boot menu, select the removable drive and press enter.
![Boot select](images/memtest_0.png)

2. From the list of storage devices, find your external drive starting with 'fs', enter the label into the command line with a colon e.g. `fs3:`
![Enter memtest drive](images/memtest_1.png)

3. Type `memtest.efi` and press enter to launch memtest86
![Launch memtest86](images/memtest_2.png)

4. Once memtest86 has loaded, select 'Config'
![Select config](images/memtest_3.png)

5. To begin testing your system's memory, select the 'Start Test' option on the left. 
![Start Test](images/memtest_4.png)

6. Memtest86 will now thoroughly test the memory installed in your computer. This may take many hours to complete depending on many variables, but will provide crucial insight into the condition of your memory modules.
![Allow the test to run](images/memtest_5.png)

7. Once the test has been completed, you will be prompted to press any key to view the results.
![Press any key to see the results once the memtest has been completed.](images/memtest_6.png)

8. Memtest86 will then display the number of errors that have been found (if any). You will also be asked if you wish to save a report to a file on the USB drive, select 'y'.
![Your results will then be displayed](images/memtest_7.png)

### Conclusion
This article has guided you through the creation and use of a memtest86 usb drive to test the memory modules in your computer.  If you find memory errors and are within warranty or have an SLA, contact us for memory replacement options. If you are self-servicing, have suitable experience and have taken the proper precautions, ensure the failing memory module(s) have been properly identified in multi module setups by rerunning the test with each module removed.