# Use the specified base image
FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04

# Set environment variables
ENV PYTHON_VERSION=3.9.17 \
    PYTORCH_VERSION=2.1.0 \
    TORCHVISION_VERSION=0.15.2 \
    TORCHAUDIO_VERSION=2.0.2 \
    PYTORCH_DOWNLOAD_URL=https://download.pytorch.org/whl/cu118/torch_stable.html

# Install Python and other necessary packages
RUN apt-get update && apt-get install -y \
    python${PYTHON_VERSION} \
    python${PYTHON_VERSION}-dev \
    python3-pip \
    git \
    make \
    && rm -rf /var/lib/apt/lists/*

# Install PyTorch, torchvision, and torchaudio
RUN pip3 install torch==${PYTORCH_VERSION}+cu118 torchvision==${TORCHVISION_VERSION}+cu118 torchaudio==${TORCHAUDIO_VERSION}+cu118 -f ${PYTORCH_DOWNLOAD_URL}

# Clone the llama.cpp repository
RUN git clone https://github.com/ggerganov/llama.cpp

# Change directory to llama.cpp and build the project with make
WORKDIR /llama.cpp
RUN make LLAMA_CUBLAS=1

# Set the working directory back to the root
WORKDIR /

# Copy the script into the image
COPY start-server.sh /start-server.sh

# Make the script executable
RUN chmod +x /start-server.sh

# Set the entrypoint to the script
ENTRYPOINT ["/start-server.sh"]
