#!/bin/bash

# Initialize variables
gguf_file_name=""
repo_slug=""
context_length=""
num_parallel_threads=16  # Default to 16 parallel threads
model_dir="${MODEL_DIR:-/workspace}"  # Use the environment variable or default to /workspace

# Parse named command-line arguments
while [ "$#" -gt 0 ]; do
  case "$1" in
    --gguf-file-name) gguf_file_name="$2"; shift 2;;
    --repo-slug) repo_slug="$2"; shift 2;;
    --context-length) context_length="$2"; shift 2;;
    --np) num_parallel_threads="$2"; shift 2;;
    *) echo "Unknown parameter passed: $1"; exit 1;;
  esac
done

# Check if variables are set
if [ -z "$gguf_file_name" ] || [ -z "$repo_slug" ] || [ -z "$context_length" ]; then
    echo "Error: Missing required arguments"
    echo "Usage: $0 --gguf-file-name <file_name> --repo-slug <repo_slug> --context-length <context_length> [--np <num_parallel_threads>]"
    exit 1
fi

# Install Hugging Face Hub Library and enable fast transfers
pip install huggingface_hub hf_transfer
export HF_HUB_ENABLE_HF_TRANSFER=1

# Function to download model using Hugging Face Hub API
download_model() {
    local repo_id="${1}"
    local file_name="${2}"
    local token="${3:-}"

    python -c "from huggingface_hub import hf_hub_download; hf_hub_download(repo_id='${repo_id}', filename='${file_name}', token='${token}' if token else None)"
}

cd ${model_dir}

# Clone the llama.cpp repository
git clone https://github.com/ggerganov/llama.cpp

# Change directory to llama.cpp and build the project with make
cd llama.cpp
make LLAMA_CUBLAS=1

cd ../

# Assemble the model path
model_path="${repo_slug}/resolve/main/${gguf_file_name}"

# Check if the model file exists in the model directory and download if it doesn't
if [ ! -f "${model_dir}/${gguf_file_name}" ]; then
    echo "Model file not found in ${model_dir}. Downloading..."
    download_model "${repo_slug}" "${gguf_file_name}" "${HUGGING_FACE_HUB_TOKEN}"
    echo "Download completed."
else
    echo "Model file ${gguf_file_name} already exists in ${model_dir}"
fi

# Calculate the actual context length by multiplying it with the number of parallel threads
actual_context_length=$(($context_length * $num_parallel_threads))

# Build the command with the -ngl flag
command="./llama.cpp/server -m ${model_dir}/${gguf_file_name} -np ${num_parallel_threads} -cb -c ${actual_context_length} --port 8080 --host 0.0.0.0 -ngl 100"
echo "Server command: $command"

# Execute the command and output directly to console
echo "Starting server..."
$command

echo "Server process has exited or failed to start."