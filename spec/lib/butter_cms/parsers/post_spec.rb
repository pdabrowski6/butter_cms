require 'spec_helper'

describe ButterCMS::Parsers::Post do
  let(:response_body) do
    {
      "meta" => {
        "count" => 3,
        "next_page" => 3,
        "previous_page" => 1
      },
      "data" => { "url" => "sample-title" }
    }.to_json
  end

  let(:response) { double(body: response_body) }

  describe '#post' do
    it 'returns post attributes' do
      parser = described_class.new(response)

      expect(parser.post).to eq({ "url" => "sample-title" })
    end
  end
end
