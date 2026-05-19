# frozen_string_literal: true

module RunApi
  module GptImage2
    module Resources
      class TextToImage
        include RunApi::Core::ResourceHelpers

        ENDPOINT = "/api/v1/gpt_image_2/text_to_image"

        RESPONSE_CLASS = Types::TextToImageResponse
        COMPLETED_RESPONSE_CLASS = Types::CompletedTextToImageResponse

        def initialize(http)
          @http = http
        end

        def run(**params)
          task = create(**params)
          poll_until_complete { get(task.id) }
        end

        def create(**params)
          params = compact_params(params)
          validate_params!(params)
          request(:post, ENDPOINT, body: params)
        end

        def get(id)
          request(:get, "#{ENDPOINT}/#{id}")
        end

        private

        def validate_params!(params)
          raise Core::ValidationError, "model is required" unless param(params, :model)
          raise Core::ValidationError, "prompt is required" unless param(params, :prompt)

          model = param(params, :model)
          unless Types::GENERATION_MODELS.include?(model)
            raise Core::ValidationError, "Invalid model: #{model}. Must be: #{Types::GENERATION_MODELS.join(", ")}"
          end

          validate_optional!(params, :aspect_ratio, Types::ASPECT_RATIOS)
        end
      end
    end
  end
end
