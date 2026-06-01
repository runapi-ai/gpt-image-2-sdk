import { createHttpClient, type ClientOptions } from '@runapi.ai/core';
import { TextToImage } from './resources/text-to-image';
import { EditImage } from './resources/edit-image';

/**
 * GPT Image 2 text-to-image API client.
 *
 * @example
 * ```typescript
 * const client = new GptImage2Client({
 *   apiKey: 'your-api-key',
 *   baseUrl: 'https://runapi.ai',
 * });
 *
 * // Text-to-image
 * const result = await client.textToImage.run({
 *   model: 'gpt-image-2',
 *   prompt: 'A futuristic cityscape at night',
 * });
 *
 * // Edit image
 * const edited = await client.editImage.run({
 *   model: 'gpt-image-2',
 *   prompt: 'Transform into oil painting style',
 *   source_image_urls: ['https://cdn.runapi.ai/public/samples/photo.jpg'],
 * });
 * ```
 */
export class GptImage2Client {
  /** Text-to-image generation operations. */
  public readonly textToImage: TextToImage;
  /** Image edit operations. */
  public readonly editImage: EditImage;

  constructor(options: ClientOptions = {}) {
    const http = createHttpClient(options);
    this.textToImage = new TextToImage(http);
    this.editImage = new EditImage(http);
  }
}
