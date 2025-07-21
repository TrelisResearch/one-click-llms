# one-click-llms
> [!TIP]
> Qwen3, Gemma 3 and Llama 4 Scout are now supported. You can also run on blackwell but need to install vllm in the pod (which will take 10 mins, see blackwell.md)

> [!TIP]
> Post a new issue if you would like other templates.
Quickly boot up an API endpoint for a given language, vision or speech/transcription model.

Built by Trelis Research [YouTube](https://Youtube.com/@TrelisResearch), [Newsletter](blog.trelis.com), [Inferencing Scripts](https://trelis.com/enterprise-server-api-and-inference-guide/)

## Runpod One-Click Templates
> [!TIP]
> To support the Trelis Research YouTube channel, you can sign up for an account with [this link](https://runpod.io?ref=jmfkcdio). Trelis is supported by a commission when you use one-click templates.

GPU Choices/Recommendations (last updated Oct 15 2024):
1. VALUE and best UI: A40 on [Runpod](https://runpod.io?ref=jmfkcdio) (48 GB VRAM) ~$0.39/hr.
2. Higher Speed: H100 PCI or SXM (80 GB VRAM) - best for fp8 models, but expensive.

### Fine-tuning Notebook Setup
- CUDA 12.1 one-click template, w/ Jupyter Lab Web Terminal [here](https://runpod.io/gsc?template=ifyqsvjlzj&ref=jmfkcdio) - allows you to run Jupyter Lab inside runpod by default.
- CUDA 12.1 one-click template, w/ VSCode Web Terminal [here](https://runpod.io/console/deploy?template=epgodh4ed3&ref=jmfkcdio) - allows you to run VSCode in a web terminal (supporting Jupyter Lab, useful if you have issues with widgets within the template above).

Note that you can access pods from either template via SSH, there is no difference there.

### Inference Engines
- [Transcription] Faster Whisper Server (Transcription only)
- [LLMs] SGLang is the fastest across all batch sizes.
- [LLMs and Multi-modal LLMs] vLLM and TGI are close on speed for small batches.
- [Multi-modal LLM] Moondream API (tiny vision + text language model).
- [LLMs] Nvidia NIM (paid service from Nvidia): a bit slower than SGLang. Also inconvenient to use as it requires login.

#### Faster Whisper
- [Whisper, incl. Turbo](https://runpod.io/console/deploy?template=v7xyt1e57i&ref=jmfkcdio)

#### SGLang (from lmsys)
- Qwen 3: [235B-A22B FP8 - currently stalling on startup](https://runpod.io/console/deploy?template=9lhiejtvka&ref=jmfkcdio), [32B dense FP8](https://runpod.io/console/deploy?template=8oc6sh1sth&ref=jmfkcdio), [30B-A3B FP8](https://runpod.io/console/deploy?template=i9yhn2ap2v&ref=jmfkcdio). Tested on 8xH100SXM (currently stalling, [issue here](https://github.com/sgl-project/sglang/issues/5950)), 1xH100SXM and 1xH100SXM, respectively. Use chat/completions. Reasoning tokens are returned separately. Note that the 30B-A3B is a little worse on performance than the 32B dense, but about 2-3x faster on inference.
- Gemma 3 it [27B FP-8](https://runpod.io/console/deploy?template=e2b4tetdya&ref=jmfkcdio)
- Llama 4 [Scout, 4xA100 or 4xH100/200 - takes about 15 mins to start](https://runpod.io/console/deploy?template=2d6atsxhzw&ref=jmfkcdio), [Maverick, 8xH100 or 8xH200 - not working yet with docker image](https://runpod.io/console/deploy?template=ubbydr232k&ref=jmfkcdio)
- DeepSeek R1 Distill Qwen: [32B](https://runpod.io/console/deploy?template=4bbrlx8ue4&ref=jmfkcdio), [1.5B](https://runpod.io/console/deploy?template=wxmkqr598l&ref=jmfkcdio)
- [Deepseek V2 Lite Chat](https://runpod.io/console/deploy?template=omqvfozjn7&ref=jmfkcdio)
- Deepseek R1 FP8 - Nvidia [(single node 8xH200)](https://runpod.io/console/deploy?template=9u3ytxvqdj&ref=jmfkcdio), [(dual node 2x8xH100)](https://runpod.io/console/deploy?template=sjy4afxvqx&ref=jmfkcdio)
- [Deepseek R1 FP8 - ROCM/AMD](https://runpod.io/console/deploy?template=xxarh523m5&ref=jmfkcdio) - Takes ~1-1.5 hours to download + load shards onto 8X MI300X.
- [Llama 3.1 Instruct 8B FP8 - ROCM/AMD](https://runpod.io/console/deploy?template=fngusf3aep&ref=jmfkcdio)
- [Qwen 2.5 Coder 32B](https://runpod.io/console/deploy?template=bxj0eugbk5&ref=jmfkcdio)
- [Llama 3.1 Instruct 8B FP8](https://runpod.io/console/deploy?template=egumitbrf3&ref=jmfkcdio), [Llama 3.1 Instruct 70B FP8](https://runpod.io/console/deploy?template=s51eiwrmif&ref=jmfkcdio), [Llama 3.1 Instruct 70B INT4](https://runpod.io/console/deploy?template=y7meeekjja&ref=jmfkcdio), [Llama 3.1 Instruct 405B FP8](https://runpod.io/console/deploy?template=psy8redq4i&ref=jmfkcdio), [Llama 3.1 Instruct 405B INT4](https://runpod.io/console/deploy?template=sn9qk811g5&ref=jmfkcdio)

#### vLLM (requires an A100 or H100 or A6000, i.e. ampere architecture):
- Voxtral: [Mini 3B (or swap in `mistralai/mistralai/Voxtral-Small-24B-2507` for the 24B model)](https://console.runpod.io/deploy?template=rs55gidqql&ref=jmfkcdio)
- Gemma 3: [27B it (bf16)](https://runpod.io/console/deploy?template=iiiurkp5pw&ref=jmfkcdio)
- Qwen 3: [235B-A22B FP8](https://runpod.io/console/deploy?template=sb7nue68ax&ref=jmfkcdio), [32B dense FP8](https://runpod.io/console/deploy?template=sybrm5hsk7&ref=jmfkcdio), [30B-A3B FP8](https://runpod.io/console/deploy?template=y3syp133lq&ref=jmfkcdio). Tested on 8xH100SXM, 1xH100SXM and 1xH100SXM, respectively. Use chat/completions. Reasoning tokens are returned separately. Note that the 30B-A3B is a little worse on performance than the 32B dense, but about 2-3x faster on inference.
- [Qwen2.5 VL - PENDING SUPPORT](https://runpod.io/console/deploy?template=b3i7t84mco&ref=jmfkcdio)
- [Llama 3.1 8B multi-lora server](https://runpod.io/console/deploy?template=p4l5qvim7s&ref=jmfkcdio)
- [Llama 3.3 70B in fp8](https://runpod.io/console/deploy?template=wlh8cgobkq&ref=jmfkcdio).
- Phi 4: [fp8 - Runs at ~32 toks on an A40](https://runpod.io/console/deploy?template=rzgcdh9rqe&ref=jmfkcdio). [bf16 Runs at ~17 toks on an A40](https://runpod.io/console/deploy?template=wlh8cgobkq&ref=jmfkcdio). 
- [Qwen 2 Audio 7B](https://runpod.io/console/deploy?template=7nfkxpzhcn&ref=jmfkcdio)
- [Qwen 2 VL 2B](https://runpod.io/console/deploy?template=gf96yn5wjb&ref=jmfkcdio), [Qwen 2 VL 7B](https://runpod.io/console/deploy?template=3dwi64mha8&ref=jmfkcdio), [Qwen 2 VL 70B](https://runpod.io/console/deploy?template=fnpg1ra9ln&ref=jmfkcdio)
- [Llama 3.2 Vision](https://runpod.io/console/deploy?template=ejpb432goj&ref=jmfkcdio)
- [Pixtral](https://runpod.io/console/deploy?template=78dbz10el3&ref=jmfkcdio)
- [Llama 3.1 Instruct 8B](https://runpod.io/console/deploy?template=vfu808ard7&ref=jmfkcdio), [Llama 3.1 Instruct 70B](https://runpod.io/console/deploy?template=rb69yhtpep&ref=jmfkcdio), [Llama 3.1 Instruct FP8 405B](https://runpod.io/console/deploy?template=h3a6ufgwjv&ref=jmfkcdio), [Llama 3.1 Instruct INT4 405B](https://runpod.io/console/deploy?template=psy8redq4i&ref=jmfkcdio)
- [Phi 3 Mini](https://runpod.io/console/deploy?template=l0rcxaaqlj&ref=jmfkcdio), [Phi 3 Small](https://runpod.io/console/deploy?template=l0rcxaaqlj&ref=jmfkcdio), [Phi 3 Medium](https://runpod.io/console/deploy?template=c5937jor68&ref=jmfkcdio)
- [Mistral Nemo Instruct (fp8)](https://runpod.io/console/deploy?template=hf0z5wads4&ref=jmfkcdio)
- [Llama 3 8B Instruct](https://runpod.io/console/deploy?template=4qmr18da9x&ref=jmfkcdio)
- [Llama 3 70B Instruct](https://runpod.io/console/deploy?template=6e9yxszwne&ref=jmfkcdio)
- [Mistral Instruct 7B AWQ](https://runpod.io/gsc?template=z5n6lh4zux&ref=jmfkcdio)
- [Mixtral Instruct 8x7B AWQ](https://runpod.io/gsc?template=dmybzldpis&ref=jmfkcdio)
- [Qwen1.5 Chat 72B AWQ](https://runpod.io/console/gpu-cloud?template=ju7oo9mf5w&ref=jmfkcdio). Needs to be run on an A100 or H100. The 48 GB of VRAM on an A6000 is insufficient.
- [CodeLlama 70B Instruct - 4bit AWQ](https://runpod.io/gsc?template=tpqmplhj2a&ref=jmfkcdio). Requires an A6000 or A100 or H100.

> [!IMPORTANT]
> Note: vLLM runs into issues sometimes if the pod template does not have the correct CUDA drivers. Unfortunately there is no way to know when picking a GPU. An issue has been raised [here](https://github.com/vllm-project/vllm/issues/2393). As an alternative, you can run TGI (and even query in openai style, guide [here](https://github.com/huggingface/text-generation-inference/commit/0eabc83541225979209ff7183b4b4442e47adf92#diff-5b4ec6c8005e6b142ac974571bb8dc557a9bb7ab7c3d0b09554dfc9cc50dcf0b)). TGI is faster than vLLM and recommended in general. Note however, that TGI does not automatically apply the chat template to the prompt when using the OpenAI style endpoint.

#### Text Generation Inference:
- [Llama 3.1 8B](https://runpod.io/console/deploy?template=mwb88n0pu0&ref=jmfkcdio)
- [IDEFICS 2 8B multi-modal](https://runpod.io/console/deploy?template=d2tjii83ba&ref=jmfkcdio)
- [Llama 3 - 8B Instruct](https://runpod.io/console/deploy?template=qlkldvr7ys&ref=jmfkcdio)
- [Llama 3 - 70B Instruct](https://runpod.io/console/deploy?template=qlkldvr7ys&ref=jmfkcdio)
- [OpenChat 3.5 7B AWQ API - RECOMMENDED](https://runpod.io/gsc?template=8me7ywyjrb&ref=jmfkcdio), [OpenChat 3.5 7B bf16 - TGI API - lowest perplexity](https://runpod.io/gsc?template=xiwn7cb3ro&ref=jmfkcdio)
- [Mixtral Instruct API 4bit AWQ - RECOMMENDED](https://runpod.io/gsc?template=546m57v73a&ref=jmfkcdio), [Mixtral Instruct API 8bit eetq, pod needs to be restarted multiple times to download all weights](https://runpod.io/gsc?template=1ydpo4766w&ref=jmfkcdio). Requires an A6000 or A100 or H100.
- [Zephyr 141B - a Mixtral 8x22B fine-tune](https://runpod.io/console/deploy?template=0896yqcr0f&ref=jmfkcdio)
- [DRBX Instruct](https://runpod.io/console/gpu-cloud?template=tlt1i1welu&ref=jmfkcdio)
- [Smaug 34B Chat (a Yi fine-tune) - fits in bf16 on an A100. BEWARE that guardrails are weaker on this model than Yi. As such, it may be best suited for structured generation](https://runpod.io/console/gpu-cloud?template=4urlqq7olr&ref=jmfkcdio)
- [TowerInstruct 13B (multi-lingual Llama 2 fine-tune)](https://runpod.io/console/gpu-cloud?template=xwduaad0fr&ref=jmfkcdio) - needs ~30 GB to run in bf16 (fits on an A6000). Add `--quantize eetq` to run with under 15 GB of VRAM (e.g. A6000).
- [Yi 34B Chat - fits in 16-bit on an A100](https://runpod.io/console/gpu-cloud?template=hd35vhie4f&ref=jmfkcdio)
- [Gemma Chat 9B](https://runpod.io/console/gpu-cloud?template=ivkssv2y93&ref=jmfkcdio).
- [Notux 8x7B AWQ](https://runpod.io/gsc?template=qyhee1k9wx&ref=jmfkcdio). Requires an A6000 or A100 or H100.
- [CodeLlama 70B Instruct - 4bit AWQ](https://runpod.io/gsc?template=ze563fijpz&ref=jmfkcdio), [CodeLlama 70B Instruct - 4bit bitsandbytes](https://runpod.io/gsc?template=vrjiai47o0&ref=jmfkcdio). Requires an A6000 or A100 or H100.
- [Mamba Instruct OpenHermes](https://runpod.io/gsc?template=58bjvimzec&ref=jmfkcdio)
- [Llama 70B API by TrelisResearch - DEPRECATED  - USE LLAMA 3.1 TEMPLATES].
- [Deepseek Coder 33B Template](https://runpod.io/gsc?template=51tpe9tqk2&ref=jmfkcdio).
- [Medusa Vicuna](https://runpod.io/gsc?template=2xpg09eenv&ref=jmfkcdio) (high speed speculative decoding - mostly a glamour template because OpenChat with AWQ is better quality and faster)

#### llama.cpp One-click templates:
- [Llama 3.1 8B - 4_K_M](https://runpod.io/console/deploy?template=9aqe40bsts&ref=jmfkcdio)
- [Mistral Nemo Instruct - pending llama cpp support](https://runpod.io/console/deploy?template=dmefdk27fl&ref=jmfkcdio)
- [Mistral 7B Instruct v0.2 8-bit](https://runpod.io/gsc?template=4g0fj4rh32&ref=jmfkcdio)

#### Nvidia NIM
- [Llama 3.1 8B](https://runpod.io/console/deploy?template=iyvm48jw77&ref=jmfkcdio)
- [Llama 3.1 70B](https://runpod.io/console/deploy?template=xi0o9zze83&ref=jmfkcdio)

#### MoonDream Multi-modal API (openai-ish)
- [Moondream2 - a small but accurate model for querying images](https://runpod.io/console/deploy?template=0m232edqmj&ref=jmfkcdio)

#### HuggingFace Speech-to-Speech
- [Combined voice-detection, speech to text, text to text, text to speech model](https://runpod.io/console/deploy?template=xen5lu2cuf&ref=jmfkcdio)

> [!TIP]
> As of July 23rd 2024, function calling fine-tuned models are being deprecated in favour of a one-shot approach with stronger models. Find the "Tool Use" video on the [Trelis YouTube Channel](https://youtube.com/@trelisresearch/) for more info.


## Running Nvidia Blackwell
See `blackwell.md`

## Changelog
15Oct2024:
- Add whisper turbo endpoint
- Deprecate Vast.AI templates.

20Jul2023:
- Update the ./llama-server.sh command in line with breaking changes to llama.cpp

Feb 16 2023:
- Added a Mamba one click template.

Jan 21 2023:
- Swapped Runpod to before Vast.AI as user experience is much better with Runpod.

Jan 9 2023:
- Added Mixtral Instruct AWQ TGI

Dec 30 2023:
- Support gated models by adding HUGGING_FACE_HUB_TOKEN env variable.
- Speed up downloading using HuggingFace API.

Dec 29 2023:
- Add in one-click llama.cpp server template.

## Vast AI One-Click Templates (DEPRECATED AS OF OCTOBER 15TH 2024).
> [!TIP]
> To support the Trelis Research YouTube channel, you can sign up for an account with [this affiliate link](https://cloud.vast.ai/?ref_id=98762). Trelis is supported by a commission when you use one-click templates.

### Fine-tuning Notebook Setup
- CUDA 12.1 one-click template [here](https://cloud.vast.ai/?ref_id=98762&creator_id=98762&name=Fine-tuning%20Notebook%20by%20Trelis%20-%20Cuda%2012.1).

### Text Generation Inference (fastest):
- [Mistral 7B api](https://cloud.vast.ai/?ref_id=98762&creator_id=98762&name=Mistral-7B%20v0.2%20vLLM%20API)

### vLLM (requires an A100 or H100 or A6000, i.e. ampere architecture):
- [Mistral 7B v0.2 AWQ](https://cloud.vast.ai/?ref_id=98762&creator_id=98762&name=Mistral%207B%20v0.2%20vLLM%20API)
- Post a new issue if you would like other templates

### llama.cpp One-click templates:
- [Mistral 7B Instruct v0.2 8-bit](https://cloud.vast.ai/?ref_id=98762&template_id=bc642dfd6e4c80a1e0807725047588b8)

### Function-calling One-Click Templates
One-click templates for function-calling are located on the HuggingFace model cards. Check out the collection [here](https://huggingface.co/collections/Trelis/function-calling-v3-657199ecbe378693925c7915).

### HuggingFace Speech-to-Speech
- [Combined voice-detection, speech to text, text to text, text to speech model](https://cloud.vast.ai/?ref_id=98762&creator_id=98762&name=HuggingFace%20Speech-to-Speech%20Server%20by%20Trelis)

