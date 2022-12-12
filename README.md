# PyTorch on AMD GPU

Check this [link](https://docs.amd.com/bundle/Hardware_and_Software_Reference_Guide/page/Hardware_and_Software_Support.html) for ROCm supported GPUs.

> Tested with AMD Radeon RX 570 Series

**Intended to work in Ubuntu 22.04.1 LTS**

## Setup

```sh
ROCM_VERSION=5.3
AMDGPU_VERSION=5.3

printf 'Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600' | sudo tee /etc/apt/preferences.d/rocm-pin-600 

curl -sL https://repo.radeon.com/rocm/rocm.gpg.key | sudo apt-key add -

printf "deb [arch=amd64] https://repo.radeon.com/rocm/apt/$ROCM_VERSION/ jammy main" | sudo tee /etc/apt/sources.list.d/rocm.list

printf "deb [arch=amd64] https://repo.radeon.com/amdgpu/$AMDGPU_VERSION/ubuntu jammy main" | sudo tee /etc/apt/sources.list.d/amdgpu.list

sudo apt install -y --no-install-recommends \
  libelf1 \
  kmod \
  file \
  python3 \
  python3-pip \
  rocm-dev \
  rocm-libs \
  build-essential

groupadd -g 109 render

export HSA_OVERRIDE_GFX_VERSION=10.3.0

pip3 install --extra-index-url https://download.pytorch.org/whl/rocm5.2
```

## Installation

```sh
python3.10 -m venv venv

venv/bin/python -m pip install -r requirements.txt
```


## Test

```sh
>  venv/bin/python test.py
GPU available? - True
GPU type - AMD Radeon RX 570 Series
```