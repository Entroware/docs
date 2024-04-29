---
title: "Install Tensorflow on Ubuntu"
date: 2024-04-15
description: "A step-by-step guide on how to install Tensorflow on Ubuntu NVIDIA systems"
summary: "This guide will walk you through how to install Tensorflow on Ubuntu and configure it for NVIDIA acceleration"
tags: ['Linux', 'TensorFlow', 'Ubuntu', 'Install', 'Configure', 'NVIDIA', 'Machine Learning']
aliases:
  - /install-tensorflow-ubuntu/
---
## Introduction
TensorFlow is a versatile platform for developing and deploying Machine Learning models. This guide will walk you through installing and setting up TensorFlow on your Ubuntu system and configure it for NVIDIA acceleration. For this you will need:
1. Computer with NVIDIA graphics
2. Ubuntu 22.04 installed
3. NVIDIA graphics drivers installed (these are already pre-installed on Entroware NVIDIA systems and do not need to be reinstalled)

------

## Installing the CUDA toolkit

Running the commands below will install the CUDA toolkit. The most up-to-date commands can be found at https://developer.nvidia.com/cuda-downloads
#### Fetching and installing the CUDA toolkit
Fetch and add the apt pin file
```bash
user@machine:~$ wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
```
```bash
user@machine:~$ sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
```
Download and install the CUDA repository package and add the keys
```bash
user@machine:~$ wget https://developer.download.nvidia.com/compute/cuda/12.4.1/local_installers/cuda-repo-ubuntu2204-12-4-local_12.4.1-550.54.15-1_amd64.deb
```
```bash
user@machine:~$ sudo dpkg -i cuda-repo-ubuntu2204-12-4-local_12.4.1-550.54.15-1_amd64.deb
```
```bash
user@machine:~$ sudo cp /var/cuda-repo-ubuntu2204-12-4-local/cuda-*-keyring.gpg /usr/share/keyrings/
```
Update the apt package list
```bash
user@machine:~$ sudo apt-get update
```
Install the CUDA Toolkit package
```bash
user@machine:~$ sudo apt-get -y install cuda-toolkit-12-4
```


#### Export variables for the CUDA toolkit
```bash
user@machine:~$ CUDA_VER=$(ls /usr/local/ | grep cuda | tail -n1)
```
```bash
user@machine:~$ echo "export PATH=\$PATH:/usr/local/${CUDA_VER}/bin" >> ~/.bashrc
```
```bash
user@machine:~$ echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/local/${CUDA_VER}/lib64" >> ~/.bashrc
```
```bash
user@machine:~$ source ~/.bashrc
```


## Installing and testing TensorFlow

#### Installing Python3 and the TensorFlow framework
```bash
user@machine:~$ sudo apt-get install python3-venv
```
```bash
user@machine:~$ python3 -m venv venv
```
```bash
user@machine:~$ source venv/bin/activate
```
```bash
user@machine:~$ pip install tensorflow[and-cuda]
```
```bash
user@machine:~$ export CUDNN_PATH=$(dirname $(python -c "import nvidia.cudnn; print(nvidia.cudnn.__file__)"))
```
```bash
user@machine:~$ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CUDNN_PATH}/lib
```

#### Testing GPU detection
You can now use TensorFlow to test whether your NVIDIA GPU is being detected properly
```bash
user@machine:~$ python3 -c "import tensorflow as tf;
print(tf.config.list_physical_devices('GPU'))"
```
If the GPU is being detected correctly, the output should look similar to the following:
```
[PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU')]
```
If the GPU is not being detected correctly, the output will be similar to:
```
Skipping registering GPU devices...
```

## Conclusion
You should now have a functioning install of the TensorFlow framework, complete with CUDA acceleration to turbocharge your Machine Learning models. More information, guides, and tools can be found on the TensorFlow website: https://www.tensorflow.org
