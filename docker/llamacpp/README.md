# Llama.cpp Dockerfile

- start-server.sh is the script to install llama.cpp and start a server within a pytorch-cuda container.
- Dockerfile is the full install.

## Build command
```
docker build -t trelis/llamacpp:v3.0 -t trelis/llamacpp:latest .
```

> Replace 'trelis' with your org on docker hub

## Test curl request to runpod
```
curl --request POST \
    --url https://{pod-id}-8080.proxy.runpod.net/completion \
    --header "Content-Type: application/json" \
    --data '{"prompt": "Building a website can be done in 10 simple steps:","n_predict": 128}'
```

# Next steps
[] Allow for private repos and use of branches/revisions.
[] Use HuggingFace API for the download, to speed up the download.
[] Deploy a simple version of a Llama.cpp server and add that to the ADVANCED fine-tuning setup. Then try to do some fine-tuning.
[x] Try to run the start script on a pytorch template. Try it in background and foreground. 
[x] adjust the flags: https://github.com/ggerganov/llama.cpp/issues/4666