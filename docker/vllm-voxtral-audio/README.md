# vLLM Voxtral Audio Docker Image

>[!WARNING]
>This approach is not working at present. It needs validation.

This Docker image extends the base vLLM OpenAI image with audio support capabilities, including FFmpeg and audio-specific packages for vLLM and mistral_common.

## Deployment Steps

### ✅ Step 1: Create the Dockerfile

The Dockerfile in this directory contains:

```dockerfile
FROM vllm/vllm-openai:latest

RUN apt-get update && apt-get install -y ffmpeg

# Add audio support to vLLM and mistral_common
RUN pip install --upgrade "vllm[audio]" --extra-index-url https://wheels.vllm.ai/nightly
RUN pip install --upgrade "mistral_common[audio]"
```

### ✅ Step 2: Build and tag the Docker image

From the same directory as the Dockerfile, run:

```bash
# Log in to Docker Hub (replace with your actual username if needed)
docker login

# Build and tag your image
docker build -t trelis/vllm-voxtral-audio:latest .
```

You can tag it with a version too:

```bash
docker tag trelis/vllm-voxtral-audio:latest trelis/vllm-voxtral-audio:v0.1
```

### ✅ Step 3: Push to Docker Hub under Trelis org

Make sure you have permission to push to the trelis organization (you must be a member of that org).

```bash
# Push both latest and versioned tags
docker push trelis/vllm-voxtral-audio:latest
docker push trelis/vllm-voxtral-audio:v0.1
```

## Image Features

- **Base**: vLLM OpenAI compatible server
- **Audio Support**: FFmpeg for audio processing
- **Enhanced Packages**: vLLM with audio support and mistral_common with audio capabilities
- **Nightly Builds**: Uses vLLM nightly wheels for latest audio features

## Usage

Once deployed, this image can be used to run vLLM servers with audio processing capabilities for models that support audio input/output. 