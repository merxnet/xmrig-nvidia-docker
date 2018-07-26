# Dockerized XMRig (NVIDIA GPU) Monero miner

[![GitHub Release](https://img.shields.io/github/release/merxnet/xmrig-nvidia-docker/all.svg)](https://github.com/merxnet/xmrig-nvidia-docker/releases)
[![GitHub Release Date](https://img.shields.io/github/release-date-pre/merxnet/xmrig-nvidia-docker.svg)](https://github.com/merxnet/xmrig-nvidia-docker/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/merxnet/xmrig-nvidia.svg)](https://hub.docker.com/r/merxnet/xmrig-nvidia/)

The goal for this code is to create a modular and easy-to-use Docker image of the popular XMRig (NVIDIA) Monero miner. Discover and support the source code [here](https://github.com/xmrig/xmrig-nvidia). There are also code repositories for "Dockerized" versions of the [CPU](https://github.com/merxnet/xmrig-cpu-docker) and [AMD GPU](https://github.com/merxnet/xmrig-amd-docker) miners as well.

## Quickstart
The Docker image created by this code is conveniently available on [Docker Hub](https://hub.docker.com/r/merxnet/xmrig-nvidia/).
```
docker pull merxnet/xmrig-nvidia
```
To get started, install the NVIDIA drivers, CUDA toolkit, NVIDIA runtime for Docker on your host machine (see the [Host Configuration](#host-configuration) section below). Once complete, all you need is a [wallet](https://getmonero.org/resources/user-guides/create_wallet.html) and a [mining pool](https://monero.org/services/mining-pools/) of your choice, such as [Moria](https://moriaxmr.com/). This information can be provided on the command line at run time:
```
nvidia-docker run merxnet/xmrig-nvidia -o ${POOL} -u ${WALLET}
```
To get the most out of mining, be sure to check out the sections below as well as the documentation at the [source code's GitHub page](https://github.com/xmrig/xmrig-nvidia#usage).

## Usage
This Docker image can be treated just like the binary -- that is, you can provide any and all command line options directly. For example:
```
nvidia-docker run -d --name xmrig-nvidia merxnet/xmrig-nvidia \
  -k \
  -a cryptonight \
  -o us.moriaxmr.com:7777 \
  -u ${WALLET} \
  --donate-level 1
```
On the other hand, if using a configuration file is more convenient, you can provide this at runtime to the container at the default location, such as:
```
nvidia-docker run -d -v my_config.json:/usr/local/bin/config.json:ro merxnet/xmrig-nvidia
```
To help create an XMRig config file, use [this](https://config.xmrig.com/) website.

## Host Configuration
For NVIDIA GPU mining, the host machine (i.e., the machine running `dockerd`) **MUST** have the NVIDIA drivers and CUDA toolkit installed. Most Linux distributions will have NVIDIA drivers available in their corresponding package repositories; otherwise, refer to the [NVIDIA Download Drivers](http://www.nvidia.com/Download/index.aspx) site.

To find out how to install the CUDA toolkit on various Linux distributions, take a look at the [Dockerfiles created by NVIDIA](https://hub.docker.com/r/nvidia/cuda/) for that purpose. Take the commands found there and run them on the host machine; otherwise, refer to the [NVIDIA CUDA Toolkit](https://developer.nvidia.com/cuda-toolkit) site.

Lastly, as mentioned above, the host machine must also have the [NVIDIA runtime for Docker](https://github.com/NVIDIA/nvidia-docker#quickstart) installed.

## Support
Feel free to fork and create pull requests or create issues. Feedback is always welcomed. One can also send donatations to the Monero wallet below.
```
43txUsLN5h3LUKpQFGsFsnRLCpCW7BvT2ZKacsfuqYpUAvt6Po8HseJPwY9ubwXVjySe5SmxVstLfcV8hM8tHg8UTVB14Tk
```
Thank you.
