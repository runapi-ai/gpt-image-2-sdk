# frozen_string_literal: true

module RunApi
  module GptImage2
    module Types
      MODELS = %w[gpt-image-2].freeze
      GENERATION_MODELS = MODELS
      EDIT_MODELS = MODELS

      ASPECT_RATIOS = %w[auto 1:1 9:16 16:9 4:3 3:4].freeze
      RESOLUTIONS = %w[1k 2k 4k].freeze

      class Image < RunApi::Core::BaseModel
        optional :url, String
      end

      class TextToImageResponse < RunApi::Core::TaskResponse
        required :id, String
        optional :status, String, enum: -> { RunApi::Core::TaskResponse::Status::ALL }
        optional :images, [-> { Image }]
        optional :error, String
      end

      EditImageResponse = TextToImageResponse

      class CompletedTextToImageResponse < TextToImageResponse
        required :images, [-> { Image }]
      end

      CompletedEditImageResponse = CompletedTextToImageResponse
    end
  end
end
