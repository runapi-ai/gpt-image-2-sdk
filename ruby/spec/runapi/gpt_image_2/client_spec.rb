# frozen_string_literal: true

require "spec_helper"

RSpec.describe RunApi::GptImage2::Client do
  let(:client) { described_class.new(api_key: "test-key") }

  it "exposes text_to_image resource" do
    expect(client.text_to_image).to be_a(RunApi::GptImage2::Resources::TextToImage)
  end

  it "exposes edit_image resource" do
    expect(client.edit_image).to be_a(RunApi::GptImage2::Resources::EditImage)
  end
end
