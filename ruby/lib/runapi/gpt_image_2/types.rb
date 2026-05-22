# frozen_string_literal: true

module RunApi
  module GptImage2
    module Types
      GENERATION_MODELS = %w[gpt-image-2-text-to-image].freeze
      EDIT_MODELS = %w[gpt-image-2-image-to-image].freeze
      MODELS = (GENERATION_MODELS + EDIT_MODELS).freeze

      ASPECT_RATIOS = %w[auto 1:1 5:4 9:16 21:9 16:9 4:3 3:2 4:5 3:4 2:3].freeze

      class Image < RunApi::Core::BaseModel
        optional :url, String
      end

      class TextToImageResponse < RunApi::Core::TaskResponse
        required :id, String
        optional :status, String, enum: -> { RunApi::Core::TaskResponse::Status::ALL }
        optional :images, [ -> { Image } ]
        optional :error, String
      end

      EditImageResponse = TextToImageResponse

      class CompletedTextToImageResponse < TextToImageResponse
        required :images, [ -> { Image } ]
      end

      CompletedEditImageResponse = CompletedTextToImageResponse
    end
  end
end
