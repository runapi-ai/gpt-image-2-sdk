# GPT Image 2 Python SDK for RunAPI

The GPT Image 2 Python SDK is the language-specific package for GPT Image 2 on RunAPI. Use this gpt image 2 api package for text-to-image, image editing, and creative production flows when your application needs JSON request bodies, task status lookup, and consistent RunAPI errors in Python.

This gpt image 2 api README is the Python package guide inside the public `gpt-image-2-sdk` repository. For the repository overview, start at `../README.md`; for model details, use https://runapi.ai/models/gpt-image-2; for API reference, use https://runapi.ai/docs#gpt-image-2; for SDK docs, use https://runapi.ai/docs#sdk-gpt-image-2.

## Install

```bash
pip install runapi-gpt-image-2
```

## Quick start

```python
from runapi.gpt_image_2 import GptImage2Client

client = GptImage2Client()  # reads RUNAPI_API_KEY, or pass api_key="sk-..."

task = client.text_to_image.create(
    model="gpt-image-2",
    prompt="A futuristic cityscape at night, cinematic",
    aspect_ratio="16:9",
    output_resolution="2k",
)
status = client.text_to_image.get(task.id)

edit = client.edit_image.create(
    model="gpt-image-2",
    prompt="Transform into oil painting style",
    source_image_urls=["https://example.com/source.jpg"],
)
```

Use `create` to submit a task and return quickly, `get` to fetch the latest task state, and `run` to create and poll until completion:

```python
result = client.text_to_image.run(
    model="gpt-image-2",
    prompt="A serene mountain lake at dawn",
)
print(result.images[0].url)
```

In web request handlers, prefer `create` plus webhook or later `get` polling so a worker is not held open.

RunAPI-generated file URLs are temporary. Download and store generated images, videos, audio, or other files in your own durable storage within 7 days; do not treat returned URLs as long-term assets.

## Language notes

Pass parameters as keyword arguments and catch the `runapi.gpt_image_2` error classes when building image jobs or scripts. The available resources are `text_to_image` and `edit_image`. Keep `RUNAPI_API_KEY` in the environment or your secret manager; never commit API keys or callback secrets.

## Links

- Model page: https://runapi.ai/models/gpt-image-2
- SDK docs: https://runapi.ai/docs#sdk-gpt-image-2
- Product docs: https://runapi.ai/docs#gpt-image-2
- Pricing and rate limits: https://runapi.ai/models/gpt-image-2/text-to-image
- Provider comparison: https://runapi.ai/providers/openai
- Full catalog: https://runapi.ai/models
- Repository: https://github.com/runapi-ai/gpt-image-2-sdk

## License

Licensed under the Apache License, Version 2.0.
