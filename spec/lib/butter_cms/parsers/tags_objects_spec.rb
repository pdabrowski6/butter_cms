require 'spec_helper'

describe ButterCMS::Parsers::TagsObjects do
  describe '.call' do
    it 'returns the array of new instances of ButterCMS::Tag' do
      tag_attributes = { name: 'Tag 1' }
      another_tag_attributes = { name: 'Tag 2' }
      attributes = [tag_attributes, another_tag_attributes]

      tags = described_class.call(attributes)

      expect(tags.first).to be_instance_of(ButterCMS::Tag)
      expect(tags.first.name).to eq('Tag 1')
      expect(tags.last).to be_instance_of(ButterCMS::Tag)
      expect(tags.last.name).to eq('Tag 2')
      expect(tags.size).to eq(2)
    end
  end
end
