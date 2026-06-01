<p align="center">
  <a href="https://runapi.ai"><img src="https://runapi.ai/icon.svg" height="56" alt="RunAPI"></a>
</p>

<h3 align="center">
  <a href="https://github.com/runapi-ai/gpt-image-2-sdk">GPT Image 2 API SDK for RunAPI</a>
</h3>

<p align="center">
  GPT Image 2 API SDKs for JavaScript, Ruby, and Go on RunAPI.
</p>

<div align="center">

[![npm](https://img.shields.io/npm/v/@runapi.ai/gpt-image-2)](https://www.npmjs.com/package/@runapi.ai/gpt-image-2)
[![RubyGems](https://img.shields.io/gem/v/runapi-gpt-image-2)](https://rubygems.org/gems/runapi-gpt-image-2)
[![Go Reference](https://pkg.go.dev/badge/github.com/runapi-ai/gpt-image-2-sdk/go.svg)](https://pkg.go.dev/github.com/runapi-ai/gpt-image-2-sdk/go)
[![License](https://img.shields.io/github/license/runapi-ai/gpt-image-2-sdk)](https://github.com/runapi-ai/gpt-image-2-sdk/blob/main/LICENSE)

</div>
<br/>

The gpt image 2 api SDK packages JavaScript, Ruby, and Go clients for GPT Image 2 on RunAPI. Use this gpt image 2 api SDK for text-to-image, image editing, and creative production workflows that need typed installs, JSON request bodies, task polling, and consistent RunAPI errors across services.

GPT Image 2 belongs to the OpenAI catalog on RunAPI. The public model page is https://runapi.ai/models/gpt-image-2 and carries pricing, rate-limit, and commercial-usage details. The public `gpt-image-2-sdk` repository groups the JavaScript, Ruby, and Go packages for this model.

## Install

```bash
npm install @runapi.ai/gpt-image-2
gem install runapi-gpt-image-2
go get github.com/runapi-ai/gpt-image-2-sdk/go@latest
```

## What you can build

- Build product imagery, creative automation, design previews, and agent image workflows with the gpt image 2 api SDK.
- Keep one model-specific repository while installing only the language package your app needs.
- Use `create` for submit-only jobs, `get` for status lookup, and `run` for submit-and-poll scripts.
- Handle authentication, validation, rate limits, insufficient credits, task failures, and polling timeouts through RunAPI SDK errors.

The JavaScript client exposes generations, edits resources, and the Ruby and Go packages mirror the same RunAPI task lifecycle.

## JavaScript quick start

```typescript
import { GptImage2Client } from '@runapi.ai/gpt-image-2';

const client = new GptImage2Client();

const task = await client.generations.create({
  // Pass the GPT Image 2 request body documented at https://runapi.ai/docs#gpt-image-2.
});

const status = await client.generations.get(task.id);
```

For short scripts, use `run` with the same JSON body to create the task and wait for completion. For web request handlers, prefer `create` plus webhook or later `get` polling so the server does not hold a worker open.

## Repository layout

- `js/` publishes `@runapi.ai/gpt-image-2`.
- `ruby/` publishes `runapi-gpt-image-2` when RubyGems publishing resumes.
- `go/` publishes `github.com/runapi-ai/gpt-image-2-sdk/go` and depends on `github.com/runapi-ai/core-sdk/go`.

## Public links

- Model page: https://runapi.ai/models/gpt-image-2
- SDK docs: https://runapi.ai/docs#sdk-gpt-image-2
- Product docs: https://runapi.ai/docs#gpt-image-2
- SDK repository: https://github.com/runapi-ai/gpt-image-2-sdk
- Skill repository: https://github.com/runapi-ai/gpt-image-2
- Provider comparison: https://runapi.ai/providers/openai
- Full catalog: https://runapi.ai/models

## Pricing

Use the GPT Image 2 model page for pricing, rate limits, and commercial usage: https://runapi.ai/models/gpt-image-2

## FAQ

### Which package should I install for gpt image 2 api work?

Install the model package for your language: `@runapi.ai/gpt-image-2`, `runapi-gpt-image-2`, or `github.com/runapi-ai/gpt-image-2-sdk/go`. Install core SDK packages only when you are building shared SDK infrastructure.

### Where should public links point?

Primary gpt image 2 api links point to https://runapi.ai/models/gpt-image-2. Provider comparisons point to https://runapi.ai/providers/openai, and broad browsing points to https://runapi.ai/models.

## License

Licensed under the Apache License, Version 2.0.
