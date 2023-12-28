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