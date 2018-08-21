require 'spec_helper'

describe ButterCMS::Category do
  describe '.all' do
    it 'returns all categories' do
      response = double('response')
      allow(ButterCMS::Requests::Get).to receive(:call).with("categories").and_return(response)
      attributes = [{"slug" => "some-slug"}]
      parser = instance_double(ButterCMS::Parsers::Categories, categories: attributes)
      allow(ButterCMS::Parsers::Categories).to receive(:new).with(response).and_return(parser)
      category = instance_double(ButterCMS::Category)
      allow(ButterCMS::Parsers::CategoriesObjects).to receive(:call).with(attributes).and_return([category])

      result = described_class.all

      expect(result).to eq([category])
      expect(parser).to have_received(:categories).once
      expect(ButterCMS::Requests::Get).to have_received(:call).with("categories").once
    end
  end
end
