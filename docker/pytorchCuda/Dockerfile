# Use the specified base image
FROM runpod/pytorch:2.1.0-py3.10-cuda11.8.0-devel-ubuntu22.04

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
