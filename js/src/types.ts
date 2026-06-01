import type { AsyncTaskStatus } from '@runapi.ai/core';

export type GptImage2Model = 'gpt-image-2';
export type GptImage2TextToImageModel = GptImage2Model;
export type GptImage2EditImageModel = GptImage2Model;

export type AspectRatio = 'auto' | '1:1' | '9:16' | '16:9' | '4:3' | '3:4';

/** Output resolution tier. 1:1 cannot be 4k; auto/unset only supports 1k. */
export type Resolution = '1k' | '2k' | '4k';

export interface TextToImageParams {
  model: GptImage2TextToImageModel;
  prompt: string;
  aspect_ratio?: AspectRatio;
  output_resolution?: Resolution;
  callback_url?: string;
}

export interface EditImageParams {
  model: GptImage2EditImageModel;
  prompt: string;
  source_image_urls: string[];
  aspect_ratio?: AspectRatio;
  output_resolution?: Resolution;
  callback_url?: string;
}

export interface TaskCreateResponse {
  id: string;
  status: string;
}

export interface Image {
  url: string;
}

export interface TextToImageResponse {
  id: string;
  status: AsyncTaskStatus;
  images?: Image[];
  error?: string;
  [key: string]: unknown;
}

export type EditImageResponse = TextToImageResponse;
