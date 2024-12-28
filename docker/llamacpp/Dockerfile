# Use the specified base image
FROM runpod/pytorch:2.1.0-py3.10-cuda11.8.0-devel-ubuntu22.04

RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
RUN echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ jammy main' | tee /etc/apt/sources.list.d/kitware.list >/dev/null
RUN apt update
RUN apt -y install cmake

# Copy the script into the image
COPY start-server.sh /start-server.sh

# Make the script executable
RUN chmod +x /start-server.sh

# Set the entrypoint to the script
ENTRYPOINT ["/start-server.sh"]
