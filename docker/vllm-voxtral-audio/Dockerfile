FROM vllm/vllm-openai:latest

RUN apt-get update && apt-get install -y ffmpeg

# Add audio support to vLLM and mistral_common
RUN pip install --upgrade "vllm[audio]" --extra-index-url https://wheels.vllm.ai/nightly
RUN pip install --upgrade "mistral_common[audio]"
