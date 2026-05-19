# GPT Image 2 API Skill for RunAPI

Generate and edit images with GPT Image 2 text-to-image and image-to-image. This skill helps Claude Code, Codex, Gemini CLI, Cursor, and 50+ agents integrate GPT Image 2 through RunAPI.

The canonical agent file is `skills/gpt-image-2/SKILL.md`.

## Install

```bash
npx skills add runapi-ai/gpt-image-2 -g
```

Or manually: clone this repo and copy `skills/gpt-image-2/` into your agent's skills directory.

## Quick example

```typescript
import { GptImage2Client } from '@runapi.ai/gpt-image-2';

const client = new GptImage2Client();
const result = await client.textToImage.run({
  model: 'gpt-image-2-text-to-image',
  prompt: 'A futuristic cityscape at night',
});
```

## Routing

- Model page: https://runapi.ai/models/gpt-image-2
- Product docs: https://runapi.ai/docs#gpt-image-2
- SDK docs: https://runapi.ai/docs#sdk-gpt-image-2
- SDK repository: https://github.com/runapi-ai/gpt-image-2-sdk
- Pricing and rate limits: https://runapi.ai/models/gpt-image-2/text-to-image
- Provider comparison: https://runapi.ai/providers/openai
- Browse all RunAPI models and skills: https://runapi.ai/models

## Variants

- [GPT Image 2 text to image](https://runapi.ai/models/gpt-image-2/text-to-image)
- [GPT Image 2 image to image](https://runapi.ai/models/gpt-image-2/image-to-image)

## Agent rules

- Keep API keys in `RUNAPI_API_KEY` or RunAPI CLI config; never commit secrets.
- Prefer `create`, `get`, and `run` JSON passthrough patterns instead of inventing flags for every model parameter.
- For gpt image 2 api pricing, rate-limit, and commercial-usage answers, link to the variant page rather than the repository README.

## License

Licensed under the Apache License, Version 2.0.
