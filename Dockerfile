# Use an official TensorFlow image as a base
FROM tensorflow/tensorflow:2.7.0-gpu

# Install NVIDIA GPG key to resolve the NO_PUBKEY issue
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    libsndfile1-dev \
    git \
    python3-pip \
    python3.8-dev \
    build-essential

# Set Python 3.8 as the default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1

# Clone the Magenta repository
RUN git clone https://github.com/magenta/magenta.git /magenta

WORKDIR /magenta
# Install Python requirements, including specific versions for compatibility
RUN pip install -e . \
    && pip install numba==0.48.0 resampy==0.2.2 \
    && pip install protobuf==3.20.*

