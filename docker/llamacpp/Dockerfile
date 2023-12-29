# Use the specified base image
FROM runpod/pytorch:2.1.0-py3.10-cuda11.8.0-devel-ubuntu22.04

# Copy the script into the image
COPY start-server.sh /start-server.sh

# Make the script executable
RUN chmod +x /start-server.sh

# Set the entrypoint to the script
ENTRYPOINT ["/start-server.sh"]
