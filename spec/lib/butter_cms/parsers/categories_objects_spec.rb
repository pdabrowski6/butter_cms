require 'spec_helper'

describe ButterCMS::Parsers::CategoriesObjects do
  describe '.call' do
    it 'returns the array of new instances of ButterCMS::Category' do
      category_attributes = { name: 'Category 1' }
      another_category_attributes = { name: 'Category 2' }
      attributes = [category_attributes, another_category_attributes]

      categories = described_class.call(attributes)

      expect(categories.first).to be_instance_of(ButterCMS::Category)
      expect(categories.first.name).to eq('Category 1')
      expect(categories.last).to be_instance_of(ButterCMS::Category)
      expect(categories.last.name).to eq('Category 2')
      expect(categories.size).to eq(2)
    end
  end
end
