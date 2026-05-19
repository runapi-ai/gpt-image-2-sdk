# frozen_string_literal: true

module RunApi
  module GptImage2
    module Resources
      class EditImage
        include RunApi::Core::ResourceHelpers

        ENDPOINT = "/api/v1/gpt_image_2/edit_image"

        RESPONSE_CLASS = Types::EditImageResponse
        COMPLETED_RESPONSE_CLASS = Types::CompletedEditImageResponse

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
          unless Types::EDIT_MODELS.include?(model)
            raise Core::ValidationError, "Invalid model: #{model}. Must be: #{Types::EDIT_MODELS.join(", ")}"
          end

          urls = param(params, :input_urls)
          if urls.nil? || (urls.respond_to?(:empty?) && urls.empty?)
            raise Core::ValidationError, "input_urls is required for image-to-image models"
          end

          validate_optional!(params, :aspect_ratio, Types::ASPECT_RATIOS)
        end
      end
    end
  end
end
