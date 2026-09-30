# frozen_string_literal: true

require "spec_helper"

RSpec.describe RunApi::GptImage2::Resources::TextToImage do
  let(:http) { instance_double(RunApi::Core::HttpClient) }
  let(:text_to_image) { described_class.new(http) }
  let(:endpoint) { "/api/v1/gpt_image_2/text_to_image" }

  describe "#create" do
    it "POSTs to the correct endpoint with required params" do
      params = {model: "gpt-image-2", prompt: "a futuristic cityscape", aspect_ratio: "16:9", output_resolution: "2k"}
      expect(http).to receive(:request).with(:post, endpoint, body: params)
        .and_return("id" => "task-1", "task_replayed" => true)

      result = text_to_image.create(**params)
      expect(result).to be_a(RunApi::GptImage2::Types::TextToImageResponse)
      expect(result.id).to eq("task-1")
      expect(result.task_replayed).to be(true)
    end
  end

  describe "#get" do
    it "GETs the correct endpoint with task id" do
      expect(http).to receive(:request).with(:get, "#{endpoint}/task-123")
        .and_return("id" => "task-123", "status" => "completed", "images" => [{"url" => "https://file.runapi.ai/result.png"}])

      result = text_to_image.get("task-123")
      expect(result.id).to eq("task-123")
      expect(result.images.first.url).to eq("https://file.runapi.ai/result.png")
    end
  end
end
