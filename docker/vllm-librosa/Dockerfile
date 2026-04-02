# Use the base image
FROM vllm/vllm-openai:v0.6.4.post1

# NCCL environment variables for multi-GPU stability
# Prevents hanging at NCCL initialization on certain hardware configurations
ENV NCCL_P2P_DISABLE=1
ENV NCCL_IB_DISABLE=1
ENV NCCL_DEBUG=WARN
ENV NCCL_SOCKET_IFNAME=eth0

# Install librosa
RUN pip install librosa

# Install curl if not already present
RUN apt-get update && apt-get install -y curl

# Create directories and download the file using Python to find the correct path
RUN python3 -c "import vllm, os; base_path = os.path.dirname(vllm.__file__); target_path = os.path.join(base_path, 'model_executor/models/qwen2_audio.py'); os.makedirs(os.path.dirname(target_path), exist_ok=True); os.system(f'curl -o {target_path} https://raw.githubusercontent.com/vllm-project/vllm/main/vllm/model_executor/models/qwen2_audio.py')"