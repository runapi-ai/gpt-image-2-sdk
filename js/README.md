# GPT Image 2 API JavaScript SDK for RunAPI

The gpt image 2 api JavaScript SDK is the language-specific package for GPT Image 2 on RunAPI. Use this gpt image 2 api package for text-to-image, image editing, and creative production flows when your application needs JSON request bodies, task status lookup, and consistent RunAPI errors in JavaScript.

This gpt image 2 api README is the JavaScript package guide inside the public `gpt-image-2-sdk` repository. For the repository overview, start at `../README.md`; for model details, use https://runapi.ai/models/gpt-image-2; for API reference, use https://runapi.ai/docs#gpt-image-2; for SDK docs, use https://runapi.ai/docs#sdk-gpt-image-2.

## Install

```bash
npm install @runapi.ai/gpt-image-2
```

## Quick start

```typescript
import { GptImage2Client } from '@runapi.ai/gpt-image-2';

const client = new GptImage2Client();
const task = await client.generations.create({
  // Pass the GPT Image 2 JSON request body from https://runapi.ai/docs#gpt-image-2.
});
const status = await client.generations.get(task.id);
```

Use `create` when you want to submit a task and return quickly, `get` when you need the latest task state, and `run` when a script should create and poll until completion. In web request handlers, prefer `create` plus webhook or later `get` polling so a worker is not held open.

RunAPI-generated file URLs are temporary. Download and store generated images, videos, audio, or other files in your own durable storage within 7 days; do not treat returned URLs as long-term assets.

## Language notes

Use the TypeScript types in `src/types.ts` and the resource classes under `src/resources` when building image applications. The available resources include generations, and edits. Keep `RUNAPI_API_KEY` in the environment or your secret manager; never commit API keys or callback secrets.

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
