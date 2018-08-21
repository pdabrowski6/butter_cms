require 'spec_helper'

describe ButterCMS::Parsers::Categories do
  let(:response_body) do
    {
      "data" => [
        { "slug" => "sample-title" }
      ]
    }.to_json
  end

  let(:response) { double(body: response_body) }

  describe '#categories' do
    it 'returns categories' do
      parser = described_class.new(response)

      expect(parser.categories).to eq([{ "slug" => "sample-title" }])
    end
  end
end
