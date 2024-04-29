---
title: "Configure docker for NVIDIA acceleration"
date: 2024-04-15
description: "Configure your docker environment for NVIDIA acceleration"
summary: "This guide will show you how to configure your docker environment to make the most of your NVIDIA hardware for GPU accelerated containers, using the NVIDIA Container Toolkit"
tags: ['Linux', 'Docker', 'Ubuntu', 'NVIDIA', 'container', 'toolkit']
aliases:
  - /configure-docker-nvidia/
---

## Introduction
The Docker container platform is a great way to deploy and install software while maintaining a consistent user and developer experience.  If you would like to learn how to set up Docker on your Ubuntu system, follow this guide: [Install Docker on Ubuntu]({{< relref "install-docker-ubuntu" >}}). However some docker images may be more suited to graphics acceleration, which requires some configuration to utilise. This guide will show you how to set up the NVIDIA Container Toolkit, so that your Docker containers can take advantage of the host NVIDIA hardware, perfect for applications such as TensorFlow to turbocharge your AI/ML models.

#### Requirements
Before you continue, please ensure you have the following:
1. A computer with an NVIDIA graphics card/ chip
2. Ubuntu 22.04 LTS installed
3. NVIDIA graphics drivers installed (NVIDIA drivers are pre-installed on Entroware NVIDIA systems and do not need to be reinstalled)
4. Docker installed ([Install Docker on Ubuntu]({{< relref "install-docker-ubuntu" >}}))


## Install the NVIDIA Container Toolkit package
Ensure the `curl` command is installed with
```bash
user@machine:~$ sudo apt install curl
```
Add the NVIDIA Container Toolkit GPG keys and add the repository
```bash
user@machine:~$ curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
```
```bash
user@machine:~$ sudo sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list
```
Update the apt package list
```bash
user@machine:~$ sudo apt-get update
```
Install the NVIDIA Container Toolkit package
```bash
user@machine:~$ sudo apt-get install -y nvidia-container-toolkit
```


## Configure the Container Toolkit and Docker
```bash
user@machine:~$ sudo nvidia-ctk runtime configure --runtime=docker
```
```bash
user@machine:~$ sudo systemctl restart docker
```
```bash
user@machine:~$ nvidia-ctk runtime configure --runtime=docker --config=$HOME/.config/docker/daemon.json
```
```bash
user@machine:~$ sudo nvidia-ctk config --set nvidia-container-cli.no-cgroups --in-place
```

## Test Docker GPU detection
#### nvidia-smi
The following test will use an Ubuntu Docker container to run the `nvidia-smi` command, which will determine whether an NVIDIA GPU is being detected within the container.
```bash
user@machine:~$ docker run --rm --runtime=nvidia --gpus all \
    --device=/dev/nvidia-uvm \
    --device=/dev/nvidia-uvm-tools \
    --device=/dev/nvidia-modeset \
    --device=/dev/nvidiactl \
    --device=/dev/nvidia0 \
    ubuntu nvidia-smi
```
If a graphics card has been successfully detected, the output should display a table, showing the model of the GPU detected, plus a table showing the processes that are currently being accelerated by the GPU (if applicable).

#### TensorFlow
The next test will use tensorflow:latest-gpu Docker container to test for GPU detection
```bash
user@machine:~$ docker run --rm --runtime=nvidia --gpus all \
    --device=/dev/nvidia-uvm \
    --device=/dev/nvidia-uvm-tools \
    --device=/dev/nvidia-modeset \
    --device=/dev/nvidiactl \
    --device=/dev/nvidia0 \
    tensorflow/tensorflow:latest-gpu \
   python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
```

Successful GPU detection output should look similar to
```
[PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU')]
```

Unsuccessful GPU detection output will look like
```
CUDA_ERROR_NO_DEVICE: no CUDA-capable device is detected
```

## Conclusion
You should now be able to run Docker containers with GPU acceleration to maximise the resources available to your applications. Whether you need to accelerate video transcoding, AI/ML models or other GPU based workloads, you can now reap the benefits as both a user and a developer.
