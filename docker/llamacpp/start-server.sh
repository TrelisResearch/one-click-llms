#!/bin/bash

# Initialize variables
gguf_file_name=""
repo_slug=""
context_length=""
model_dir="${MODEL_DIR:-/workspace}"  # Use the environment variable or default to /workspace

# Parse named command-line arguments
while [ "$#" -gt 0 ]; do
  case "$1" in
    --gguf_file-name) gguf_file_name="$2"; shift 2;;
    --repo-slug) repo_slug="$2"; shift 2;;
    --context-length) context_length="$2"; shift 2;;
    *) echo "Unknown parameter passed: $1"; exit 1;;
  esac
done

# Check if variables are set
if [ -z "$gguf_file_name" ] || [ -z "$repo_slug" ] || [ -z "$context_length" ]; then
    echo "Error: Missing required arguments"
    echo "Usage: $0 --gguf_file-name <file_name> --repo-slug <repo_slug> --context-length <context_length>"
    exit 1
fi

# Assemble the model path
model_path="${repo_slug}/resolve/main/${gguf_file_name}"

# Check if the model file exists in the model directory and download if it doesn't
if [ ! -f "${model_dir}/${gguf_file_name}" ]; then
    echo "Model file not found in ${model_dir}. Downloading..."
    wget -P "${model_dir}" "https://huggingface.co/${model_path}"
    echo "Download completed."
else
    echo "Model file ${gguf_file_name} already exists in ${model_dir}"
fi

# Build the command with the -ngl flag
command="/llama.cpp/server -m ${model_dir}/${gguf_file_name} -c ${context_length} --port 8080 --host 0.0.0.0 -ngl 64"
echo "Server command: $command"

# Execute the command and output directly to console
echo "Starting server..."
$command

echo "Server process has exited or failed to start."