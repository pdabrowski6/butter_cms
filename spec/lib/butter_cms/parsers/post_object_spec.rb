require 'spec_helper'

describe ButterCMS::Parsers::PostObject do
  describe '.call' do
    it 'returns new ButterCMS::Post instance' do
      category_attributes = { 'name' => 'Category 1' }
      author_attributes = { 'name' => 'John Doe' }
      tag_attributes = { 'name' => 'Tag 1' }
      post_attributes = {
        'title' => 'post title',
        'categories' => [category_attributes],
        'author' => author_attributes,
        'tags' => [tag_attributes]
      }
      category = instance_double(ButterCMS::Category)
      tag = instance_double(ButterCMS::Tag)
      author = instance_double(ButterCMS::Author)
      post = instance_double(ButterCMS::Post)
      allow(ButterCMS::Parsers::TagsObjects).to receive(:call).with(
        [tag_attributes]
      ).and_return([tag])
      allow(ButterCMS::Parsers::CategoriesObjects).to receive(:call).with(
        [category_attributes]
      ).and_return([category])
      allow(ButterCMS::Parsers::AuthorObject).to receive(:call).with(
        author_attributes
      ).and_return(author)
      updated_attributes = {
        'title' => 'post title',
        'categories' => [category],
        'author' => author,
        'tags' => [tag]
      }
      allow(ButterCMS::Post).to receive(:new).with(
        updated_attributes
      ).and_return(post)

      result = described_class.call(
        post_attributes
      )

      expect(result).to eq(post)
      expect(ButterCMS::Parsers::TagsObjects).to have_received(:call).with(
        [tag_attributes]
      ).once
      expect(ButterCMS::Parsers::CategoriesObjects).to have_received(:call).with(
        [category_attributes]
      ).once
      expect(ButterCMS::Parsers::AuthorObject).to have_received(:call).with(
        author_attributes
      ).once
    end
  end
end
