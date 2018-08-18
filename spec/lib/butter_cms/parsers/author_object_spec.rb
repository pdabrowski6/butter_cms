require 'spec_helper'

describe ButterCMS::Parsers::AuthorObject do
  describe '.call' do
    it 'returns new instance of ButterCMS::Author' do
      attributes = { name: 'John Doe' }

      author = described_class.call(attributes)

      expect(author).to be_instance_of(ButterCMS::Author)
      expect(author.name).to eq('John Doe')
    end
  end
end
