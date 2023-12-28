# Llama.cpp Dockerfile

- start-server.sh is the script to install llama.cpp and start a server within a pytorch-cuda container.
- Dockerfile is the full install.

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
[] Deploy a simple version of Llama.cpp and add that to the ADVANCED fine-tuning setup. Then try to do some fine-tuning.
[] Try to run the start script on a pytorch template. Try it in background and foreground. 
[] adjust the flags: https://github.com/ggerganov/llama.cpp/issues/4666