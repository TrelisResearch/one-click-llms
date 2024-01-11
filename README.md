# one-click-llms
These one click templates allow you to quickly boot up an API for a given language model.

- Make sure to read through the README file on the templates!
- Vast.AI is recommended for lowest cost per hour with smaller GPUs like A4000 and A2000. Runpod is recommended (better user interface) if using larger GPUs like A6000, A100 or H100.

Advanced inferencing scripts (incl. for function calling) are available for purchase [here](https://trelis.com/enterprise-server-api-and-inference-guide/).

## Vast AI One-Click Templates
To support the Trelis Research YouTube channel, you can sign up for an account with [this affiliate link](https://cloud.vast.ai/?ref_id=98762). Trelis is also supported by a 1-2% commission by your use of one-click templates.

Text Generation Inference (fastest):
- [Mistral 7B api](https://cloud.vast.ai/?ref_id=98762&creator_id=98762&name=Mistral%207B%20TGI%20API)

vLLM (requires an A100 or H100 or A6000, i.e. ampere architecture):
- [Mistral 7B v0.2 AWQ](https://cloud.vast.ai/?ref_id=98762&creator_id=98762&name=Mistral%207B%20v0.2%20vLLM%20API)
- Post a new issue if you would like other templates

llama.cpp One-click templates:
- [Mistral 7B Instruct v0.2 8-bit](https://cloud.vast.ai/?ref_id=98762&template_id=bc642dfd6e4c80a1e0807725047588b8)

## Runpod One-Click Templates
To support the Trelis Research YouTube channel, you can sign up for an account with [this link](https://runpod.io?ref=jmfkcdio). Trelis is also supported by a 1-2% commission by your use of one-click templates.

Text Generation Inference (fastest):
- [OpenChat 3.5-1210 7B AWQ API - RECOMMENDED](https://runpod.io/gsc?template=8me7ywyjrb&ref=jmfkcdio).
- [Mixtral Instruct API 4bit AWQ - RECOMMENDED](https://runpod.io/gsc?template=546m57v73a&ref=jmfkcdio), [Mixtral Instruct API 8bit eetq](https://runpod.io/gsc?template=1ydpo4766w&ref=jmfkcdio). Requires an A6000 or A100 or H100.
- [Llama 70B API by TrelisResearch](https://runpod.io/gsc?template=6e9yxszwne&ref=jmfkcdio).
- [Deepseek Coder 33B Template](https://runpod.io/gsc?template=51tpe9tqk2&ref=jmfkcdio).
- [Medusa Vicuna](https://runpod.io/gsc?template=2xpg09eenv&ref=jmfkcdio) (high speed speculative decoding - mostly a glamour template because OpenChat with AWQ is better quality and faster)

vLLM (requires an A100 or H100 or A6000, i.e. ampere architecture):
- [Mistral 7B AWQ](https://runpod.io/gsc?template=z5n6lh4zux&ref=jmfkcdio)
- [Mixtral Instruct AWQ](https://runpod.io/gsc?template=dmybzldpis&ref=jmfkcdio)

llama.cpp One-click templates:
- [Mistral 7B Instruct v0.2 8-bit](https://runpod.io/gsc?template=4g0fj4rh32&ref=jmfkcdio)

Post a new issue if you would like other templates

## Function-calling One-Click Templates
One-click templates for function-calling are located on the HuggingFace model cards. Check out the collection [here](https://huggingface.co/collections/Trelis/function-calling-v3-657199ecbe378693925c7915).

## Changelog

Jan 9 2023:
- Added Mixtral Instruct AWQ TGI

Dec 30 2023:
- Support gated models by adding HUGGING_FACE_HUB_TOKEN env variable.
- Speed up downloading using HuggingFace API.

Dec 29 2023:
- Add in one-click llama.cpp server template.
