require 'spec_helper'

describe ButterCMS::Parsers::Posts do
  let(:response_body) do
    {
      "meta" => {
        "count" => 3,
        "next_page" => 3,
        "previous_page" => 1
      },
      "data" => [
        { "url" => "sample-title" }
      ]
    }.to_json
  end

  let(:response) { double(body: response_body) }

  describe '#next_page' do
    it 'returns next page' do
      parser = described_class.new(response)

      expect(parser.next_page).to eq(3)
    end
  end

  describe '#previous_page' do
    it 'returns previous page' do
      parser = described_class.new(response)

      expect(parser.previous_page).to eq(1)
    end
  end

  describe '#count' do
    it 'returns the total count of posts' do
      parser = described_class.new(response)

      expect(parser.count).to eq(3)
    end
  end

  describe '#posts' do
    it 'returns posts' do
      parser = described_class.new(response)

      expect(parser.posts).to eq([{ "url" => "sample-title" }])
    end
  end
end
