import type { AsyncTaskStatus } from '@runapi.ai/core';

export type GptImage2TextToImageModel = 'gpt-image/2-text-to-image';
export type GptImage2EditImageModel = 'gpt-image/2-image-to-image';

export type AspectRatio =
  | 'auto'
  | '1:1'
  | '5:4'
  | '9:16'
  | '21:9'
  | '16:9'
  | '4:3'
  | '3:2'
  | '4:5'
  | '3:4'
  | '2:3';

export interface TextToImageParams {
  model: GptImage2TextToImageModel;
  prompt: string;
  aspect_ratio?: AspectRatio;
  nsfw_checker?: boolean;
  callback_url?: string;
}

export interface EditImageParams {
  model: GptImage2EditImageModel;
  prompt: string;
  input_urls: string[];
  aspect_ratio?: AspectRatio;
  nsfw_checker?: boolean;
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
