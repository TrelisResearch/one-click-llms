# Run **vLLM-OpenAI** on Blackwell (B200)  
### Model: `unsloth/gemma-3-27b-it`  (8 k context, 27 B params)

These steps assume you launch a **RunPod** GPU pod with the Docker image  
`runpod/pytorch:2.8.0-py3.11-cuda12.8.1-cudnn-devel-ubuntu22.04` (CUDA 12.8, PyTorch 2.8, Blackwell-ready) and you must set: `DISABLE_RUNPOD_MONITOR=1` in the environment variables. You can use [this template](https://runpod.io/console/deploy?template=rn8q5phorn&ref=jmfkcdio) to start, and then follow the readme below.

---

## 1  SSH into the container
```bash
ssh pod@<your-pod-ip>
```

---

## 2  Install build tools (≈30 s)
```bash
apt-get update -qq && \
apt-get install -y --no-install-recommends git ninja-build cmake && \
rm -rf /var/lib/apt/lists/*
```

---

## 3  Upgrade Python packaging (≈10 s)
```bash
pip install -U pip setuptools wheel
```

---

## 4  Clone **vLLM** and compile for Blackwell (8–12 min)
```bash
pip install uv
git clone --depth 1 https://github.com/vllm-project/vllm /opt/vllm
uv pip install -e /opt/vllm --system          # nvcc builds native sm_100 kernels
```

---

## 5  Sanity check
```bash
python - <<'PY'
import torch, vllm
print("Torch :", torch.__version__, torch.cuda.get_arch_list())
print("vLLM  :", vllm.__version__)
PY
```

Expected output includes `sm_100` and **no** “unknown architecture” warnings.

---

## 6  Launch the OpenAI-compatible server
```bash
python -m vllm.entrypoints.openai.api_server \
    --model unsloth/gemma-3-27b-it \
    --max-model-len 8192 \
    --host 0.0.0.0 \
    --port 8000
```

* **`bfloat16`** is fastest on B200; omit `--dtype` if VRAM allows FP16/full precision.  
* Add `--download-dir /data/hf` if you mounted a persistent HF cache.

### Quick curl test
```bash
curl http://<pod-IP>:8000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
        "model":"unsloth/gemma-3-27b-it",
        "messages":[{"role":"user","content":"Hello!"}]
      }'
```

---
**You’re now serving a 27 B Gemma-IT model with 8 k context on Blackwell hardware at full speed.**
