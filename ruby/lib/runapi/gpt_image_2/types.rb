# frozen_string_literal: true

module RunApi
  module GptImage2
    # Type definitions and constants for GPT Image 2.
    # Unlike GPT Image 1.5, aspect_ratio and output_resolution are optional.
    module Types
      MODELS = %w[gpt-image-2].freeze
      GENERATION_MODELS = MODELS
      EDIT_MODELS = MODELS

      # 'auto' lets the model choose based on the prompt content.
      ASPECT_RATIOS = %w[auto 1:1 9:16 16:9 4:3 3:4].freeze
      # Output resolution tiers. 1:1 is limited to 1k and 2k.
      RESOLUTIONS = %w[1k 2k 4k].freeze

      # A single generated image with its CDN URL.
      class Image < RunApi::Core::BaseModel
        optional :url, String
      end

      # Generation result. +images+ is populated once +status+ is +"completed"+.
      class TextToImageResponse < RunApi::Core::TaskResponse
        required :id, String
        optional :status, String, enum: -> { RunApi::Core::TaskResponse::Status::ALL }
        optional :images, [-> { Image }]
        optional :error, String
      end

      # Edit response -- same shape as generation.
      EditImageResponse = TextToImageResponse

      # Narrowed response from +run()+ where +images+ is guaranteed present.
      class CompletedTextToImageResponse < TextToImageResponse
        required :images, [-> { Image }]
      end

      CompletedEditImageResponse = CompletedTextToImageResponse
    end
  end
end
