# one-click-llms
These one click templates allow you to quickly boot up an API for a given language model.

- Make sure to read through the README file on the templates!
- Runpod is recommended (better user interface) if using larger GPUs like A6000, A100 or H100.
- Vast.AI is recommended for lowest cost per hour with smaller GPUs like A4000 and A2000. However, the user experience is significantly worse with Vast.AI than runpod.

Advanced inferencing scripts (incl. for function calling) are available for purchase [here](https://trelis.com/enterprise-server-api-and-inference-guide/).

> Note: vLLM runs into issues sometimes if the pod template does not have the correct CUDA drivers. Unfortunately there is no way to know when picking a GPU. An issue has been raised [here](https://github.com/vllm-project/vllm/issues/2393). As an alternative, you can run TGI (and even query in openai style, guide [here](https://github.com/huggingface/text-generation-inference/commit/0eabc83541225979209ff7183b4b4442e47adf92#diff-5b4ec6c8005e6b142ac974571bb8dc557a9bb7ab7c3d0b09554dfc9cc50dcf0b)). TGI is faster than vLLM and recommended in general. Note however, that TGI does not automatically apply the chat template to the prompt when using the OpenAI style endpoint.

## Runpod One-Click Templates
To support the Trelis Research YouTube channel, you can sign up for an account with [this link](https://runpod.io?ref=jmfkcdio). Trelis is also supported by a 1-2% commission by your use of one-click templates.

### Fine-tuning Notebook Setup
- CUDA 12.1 one-click template [here](https://runpod.io/gsc?template=ifyqsvjlzj&ref=jmfkcdio)

### MoonDream Multi-modal API (openai-ish)
- [Moondream2 - a small but accurate model for querying images](https://runpod.io/console/deploy?template=0m232edqmj&ref=jmfkcdio)

### vLLM (requires an A100 or H100 or A6000, i.e. ampere architecture):
Note: The vLLM image has compatibility issues with certain Runpod CUDA drivers, leading to issues on certain pods. A6000 Ada is typically an option that works.
- [Phi 3 Mini](https://runpod.io/console/deploy?template=l0rcxaaqlj&ref=jmfkcdio)
- [Mistral Nemo Instruct -pending Docker image update](https://runpod.io/console/deploy?template=hf0z5wads4&ref=jmfkcdio)
- [Llama 3 8B Instruct](https://runpod.io/console/deploy?template=4qmr18da9x&ref=jmfkcdio)
- [Llama 3 70B Instruct](https://runpod.io/console/deploy?template=6e9yxszwne&ref=jmfkcdio)
- [Mistral Instruct 7B AWQ](https://runpod.io/gsc?template=z5n6lh4zux&ref=jmfkcdio)
- [Mixtral Instruct 8x7B AWQ](https://runpod.io/gsc?template=dmybzldpis&ref=jmfkcdio)
- [Qwen1.5 Chat 72B AWQ](https://runpod.io/console/gpu-cloud?template=ju7oo9mf5w&ref=jmfkcdio). Needs to be run on an A100 or H100. The 48 GB of VRAM on an A6000 is insufficient.
- [CodeLlama 70B Instruct - 4bit AWQ](https://runpod.io/gsc?template=tpqmplhj2a&ref=jmfkcdio). Requires an A6000 or A100 or H100.

### Text Generation Inference:
- [IDEFICS 2 8B multi-modal](https://runpod.io/console/deploy?template=d2tjii83ba&ref=jmfkcdio)
- [Llama 3 - 8B Instruct](https://runpod.io/console/deploy?template=qlkldvr7ys&ref=jmfkcdio)
- [Llama 3 - 70B Instruct](https://runpod.io/console/deploy?template=qlkldvr7ys&ref=jmfkcdio)
- [OpenChat 3.5 7B AWQ API - RECOMMENDED](https://runpod.io/gsc?template=8me7ywyjrb&ref=jmfkcdio), [OpenChat 3.5 7B bf16 - TGI API - lowest perplexity](https://runpod.io/gsc?template=xiwn7cb3ro&ref=jmfkcdio)
- [Mixtral Instruct API 4bit AWQ - RECOMMENDED](https://runpod.io/gsc?template=546m57v73a&ref=jmfkcdio), [Mixtral Instruct API 8bit eetq, pod needs to be restarted multiple times to download all weights](https://runpod.io/gsc?template=1ydpo4766w&ref=jmfkcdio). Requires an A6000 or A100 or H100.
- [Zephyr 141B - a Mixtral 8x22B fine-tune](https://runpod.io/console/deploy?template=0896yqcr0f&ref=jmfkcdio)
- [DRBX Instruct](https://runpod.io/console/gpu-cloud?template=tlt1i1welu&ref=jmfkcdio)
- [Smaug 34B Chat (a Yi fine-tune) - fits in bf16 on an A100. BEWARE that guardrails are weaker on this model than Yi. As such, it may be best suited for structured generation](https://runpod.io/console/gpu-cloud?template=4urlqq7olr&ref=jmfkcdio)
- [TowerInstruct 13B (multi-lingual Llama 2 fine-tune)](https://runpod.io/console/gpu-cloud?template=xwduaad0fr&ref=jmfkcdio) - needs ~30 GB to run in bf16 (fits on an A6000). Add `--quantize eetq` to run with under 15 GB of VRAM (e.g. A4000).
- [Yi 34B Chat - fits in 16-bit on an A100](https://runpod.io/console/gpu-cloud?template=hd35vhie4f&ref=jmfkcdio)
- [Gemma Chat 9B](https://runpod.io/console/gpu-cloud?template=ivkssv2y93&ref=jmfkcdio).
- [Notux 8x7B AWQ](https://runpod.io/gsc?template=qyhee1k9wx&ref=jmfkcdio). Requires an A6000 or A100 or H100.
- [CodeLlama 70B Instruct - 4bit AWQ](https://runpod.io/gsc?template=ze563fijpz&ref=jmfkcdio), [CodeLlama 70B Instruct - 4bit bitsandbytes](https://runpod.io/gsc?template=vrjiai47o0&ref=jmfkcdio). Requires an A6000 or A100 or H100.
- [Mamba Instruct OpenHermes](https://runpod.io/gsc?template=58bjvimzec&ref=jmfkcdio)
- [Llama 70B API by TrelisResearch](https://runpod.io/gsc?template=6e9yxszwne&ref=jmfkcdio).
- [Deepseek Coder 33B Template](https://runpod.io/gsc?template=51tpe9tqk2&ref=jmfkcdio).
- [Medusa Vicuna](https://runpod.io/gsc?template=2xpg09eenv&ref=jmfkcdio) (high speed speculative decoding - mostly a glamour template because OpenChat with AWQ is better quality and faster)

### llama.cpp One-click templates:
- [Mistral Nemo Instruct - pending llama cpp support](https://runpod.io/console/deploy?template=dmefdk27fl&ref=jmfkcdio)
- [Mistral 7B Instruct v0.2 8-bit](https://runpod.io/gsc?template=4g0fj4rh32&ref=jmfkcdio)

Post a new issue if you would like other templates

## Vast AI One-Click Templates
To support the Trelis Research YouTube channel, you can sign up for an account with [this affiliate link](https://cloud.vast.ai/?ref_id=98762). Trelis is also supported by a 1-2% commission by your use of one-click templates.

### Fine-tuning Notebook Setup
- CUDA 12.1 one-click template [here](https://cloud.vast.ai/?ref_id=98762&creator_id=98762&name=Fine-tuning%20Notebook%20by%20Trelis%20-%20Cuda%2012.1).

### Text Generation Inference (fastest):
- [Mistral 7B api](https://cloud.vast.ai/?ref_id=98762&creator_id=98762&name=Mistral-7B%20v0.2%20vLLM%20API)

### vLLM (requires an A100 or H100 or A6000, i.e. ampere architecture):
- [Mistral 7B v0.2 AWQ](https://cloud.vast.ai/?ref_id=98762&creator_id=98762&name=Mistral%207B%20v0.2%20vLLM%20API)
- Post a new issue if you would like other templates

### llama.cpp One-click templates:
- [Mistral 7B Instruct v0.2 8-bit](https://cloud.vast.ai/?ref_id=98762&template_id=bc642dfd6e4c80a1e0807725047588b8)

## Function-calling One-Click Templates
One-click templates for function-calling are located on the HuggingFace model cards. Check out the collection [here](https://huggingface.co/collections/Trelis/function-calling-v3-657199ecbe378693925c7915).

## Changelog
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
