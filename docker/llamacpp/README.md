# Llama.cpp Dockerfile

- start-server.sh is the script to install llama.cpp and start a server within a pytorch-cuda container.
- Dockerfile is the full install.

## Build command
```
docker build -t trelis/llamacpp:v2.0 -t trelis/llamacpp:latest .
```

> Replace 'trelis' with your org on docker hub

## Test curl request to runpod
```
curl --request POST \
    --url https://{pod-id}-8080.proxy.runpod.net/completion \
    --header "Content-Type: application/json" \
    --data '{"prompt": "Building a website can be done in 10 simple steps:","n_predict": 128}'
```

## Updates required
1. For some reason, the cuda drivers aren't being installed correctly. Unclear why this is the case.

1. Save the weights to a specific location (CACHE_DIR).
1. Allow for private gated repos.

# Next steps
[] Allow for private repos
[] Use HuggingFace for the download, in case it's quicker...
[] Deploy a simple version of Llama.cpp and add that to the ADVANCED fine-tuning setup. Then try to do some fine-tuning.
[x] Try to run the start script on a pytorch template. Try it in background and foreground. 
[x] adjust the flags: https://github.com/ggerganov/llama.cpp/issues/4666