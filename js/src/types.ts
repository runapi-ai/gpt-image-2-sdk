import type { AsyncTaskStatus, TaskResponse } from '@runapi.ai/core';

/** Single model slug for all GPT Image 2 operations. */
export type GptImage2Model = 'gpt-image-2';
export type GptImage2TextToImageModel = GptImage2Model;
export type GptImage2EditImageModel = GptImage2Model;

/**
 * Output aspect ratio. 'auto' lets the model choose based on the prompt.
 * Unlike GPT Image 1.5, aspect_ratio is optional here.
 */
export type AspectRatio = 'auto' | '1:1' | '9:16' | '16:9' | '4:3' | '3:4';

/** Output resolution tier. 1:1 cannot be 4k; auto/unset only supports 1k. */
export type Resolution = '1k' | '2k' | '4k';

/** Background: transparent, opaque, or auto. Omit to let the model choose. */
export type Background = 'transparent' | 'opaque' | 'auto';

/**
 * Parameters for GPT Image 2 text-to-image generation.
 * Unlike GPT Image 1.5, aspect_ratio and output_resolution are optional.
 */
export interface TextToImageParams {
  model: GptImage2TextToImageModel;
  /** Text description of the desired image. */
  prompt: string;
  /** Output aspect ratio. Optional; 'auto' lets the model decide. */
  aspect_ratio?: AspectRatio;
  /** Output resolution tier. 1:1 is limited to 1k and 2k. */
  output_resolution?: Resolution;
  /** Background: transparent, opaque, or auto. Omit to let the model choose. */
  background?: Background;
  /** Webhook URL for completion notifications. */
  callback_url?: string;
}

/**
 * Parameters for GPT Image 2 image editing.
 * Applies prompt-guided edits to 1-16 source images.
 */
export interface EditImageParams {
  model: GptImage2EditImageModel;
  /** Text description of the desired edit. */
  prompt: string;
  /** Source image URLs to edit (1-16). */
  source_image_urls: string[];
  /** Output aspect ratio. Optional; 'auto' lets the model decide. */
  aspect_ratio?: AspectRatio;
  /** Output resolution tier. 1:1 is limited to 1k and 2k. */
  output_resolution?: Resolution;
  /** Background: transparent, opaque, or auto. Omit to let the model choose. */
  background?: Background;
  /** Webhook URL for completion notifications. */
  callback_url?: string;
}

/** Acknowledged task with its server-assigned ID. */
export interface TaskCreateResponse {
  id: string;
  status: string;
  /** True when this idempotency key reused the original task. */
  task_replayed?: boolean;
}

/** A single generated image with its CDN URL. */
export interface Image {
  url: string;
}

/**
 * Generation result for a GPT Image 2 task.
 * `images` is populated once `status` reaches `'completed'`.
 */
export interface TextToImageResponse extends TaskResponse {
  id: string;
  status: AsyncTaskStatus;
  images?: Image[];
  error?: string;
  [key: string]: unknown;
}

/** Edit response -- same shape as generation. */
export type EditImageResponse = TextToImageResponse;
