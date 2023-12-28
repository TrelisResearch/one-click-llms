#!/bin/bash

# Assigning command-line arguments to variables
gguf_file_name="$1"
repo_slug="$2"
context_length="$3"

# Assemble the model path
model_path="${repo_slug}/resolve/main/${gguf_file_name}"

# Check if the file exists and download if it doesn't
if [ ! -f "${gguf_file_name}" ]; then
    wget "https://huggingface.co/${model_path}"
else
    echo "${gguf_file_name} already exists!"
fi

# Clone the llama.cpp repository
git clone https://github.com/ggerganov/llama.cpp

# Change directory to llama.cpp
cd llama.cpp || exit

# Build the project with make
make LLAMA_CUBLAS=1

# Build the command with the -ngl flag
command="./server -m ${gguf_file_name} -c ${context_length} --port 8080 --host 0.0.0.0 -ngl 64"

# Execute the command in the background
$command &

# Optionally print a message indicating that the server has started
echo "Server started..."
