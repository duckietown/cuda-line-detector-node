#!/bin/bash

set -e

# install CUDA deps
apt-get update
apt-get install -y libopenblas-base libopenmpi-dev
rm -rf /var/lib/apt/lists/*

# download TensorRT
echo "Downloading TensorRT v${TENSORRT_VERSION}..."
TENSORRT_WHEEL_NAME=tensorrt-${TENSORRT_VERSION}-cp38-cp38-linux_aarch64.whl
WHEEL_URL="https://duckietown-public-storage.s3.amazonaws.com/assets/python/wheels/${TENSORRT_WHEEL_NAME}"
wget -q "${WHEEL_URL}" -O "/tmp/${TENSORRT_WHEEL_NAME}"
# install TensorRT
echo "Installing TensorRT v${TENSORRT_VERSION}..."
pip3 install "/tmp/${TENSORRT_WHEEL_NAME}"
rm "/tmp/${TENSORRT_WHEEL_NAME}"

# download PyCUDA
echo "Downloading PyCUDA v${PYCUDA_VERSION}..."
TENSORRT_WHEEL_NAME=pycuda-${PYCUDA_VERSION}-cp38-cp38-linux_aarch64.whl
WHEEL_URL="https://duckietown-public-storage.s3.amazonaws.com/assets/python/wheels/${TENSORRT_WHEEL_NAME}"
wget -q "${WHEEL_URL}" -O "/tmp/${TENSORRT_WHEEL_NAME}"
# install PyCUDA
echo "Installing PyCUDA v${PYCUDA_VERSION}..."
pip3 install "/tmp/${TENSORRT_WHEEL_NAME}"
rm "/tmp/${TENSORRT_WHEEL_NAME}"

# clean
pip3 uninstall -y dataclasses

apt-get update && apt-get install g++-8 unzip -y

#TARGET="https://pypi.python.org/simple/pycuda/"
#PATTERN="pycuda-2021.1.tar.gz"

#wget --recursive --no-directories --accept=$PATTERN $TARGET

#wget https://files.pythonhosted.org/packages/5a/56/4682a5118a234d15aa1c8768a528aac4858c7b04d2674e18d586d3dfda04/pycuda-2021.1.tar.gz
#tar -xfv pycuda.tar.gz -C ./pycuda_build

#CUDA_INC_DIR=/usr/local/cuda-10.2 pip3 install pycuda
