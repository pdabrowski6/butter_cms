require 'spec_helper'

describe ButterCMS::Resource do
  describe 'attributes assignment' do
    it 'assigns attributes from the given hash' do
      attributes = { 'title' => 'my title', 'slug' => 'sample-slug' }

      resource = described_class.new(attributes)

      expect(resource.title).to eq(attributes['title'])
      expect(resource.slug).to eq(attributes['slug'])
    end
  end
end
