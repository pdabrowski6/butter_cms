require 'spec_helper'

describe ButterCMS::PostsFetchService do
  describe '#more_posts?' do
    it 'returns true if there are more posts to fetch' do
      request_options = { page: 1, per_page: 10 }
      post_attributes = { title: 'Post title' }
      parser = instance_double(ButterCMS::Parsers::Posts, next_page: 2)
       response = double('response')
      allow(ButterCMS::Requests::Get).to receive(:call).with(
        "posts", request_options
      ).and_return(response)
      allow(ButterCMS::Parsers::Posts).to receive(:new).with(response).and_return(parser)

      service = described_class.new(request_options)
      result = service.more_posts?

      expect(result).to eq(true)
      expect(ButterCMS::Requests::Get).to have_received(:call).with(
        "posts", request_options
      ).once
    end

    it 'returns false if there are no more posts to fetch' do
      request_options = { page: 1, per_page: 10 }
      post_attributes = { title: 'Post title' }
      parser = instance_double(ButterCMS::Parsers::Posts, next_page: nil)
       response = double('response')
      allow(ButterCMS::Requests::Get).to receive(:call).with(
        "posts", request_options
      ).and_return(response)
      allow(ButterCMS::Parsers::Posts).to receive(:new).with(response).and_return(parser)

      service = described_class.new(request_options)
      result = service.more_posts?

      expect(result).to eq(false)
      expect(ButterCMS::Requests::Get).to have_received(:call).with(
        "posts", request_options
      ).once
    end
  end

  describe '#posts' do
    it 'returns posts from given request' do
      request_options = { page: 1, per_page: 10 }
      post_attributes = { title: 'Post title' }
      parser = instance_double(ButterCMS::Parsers::Posts, posts: [post_attributes])
      post = instance_double(ButterCMS::Post)
      response = double('response')
      allow(ButterCMS::Requests::Get).to receive(:call).with(
        "posts", request_options
      ).and_return(response)
      allow(ButterCMS::Parsers::Posts).to receive(:new).with(response).and_return(parser)
      allow(ButterCMS::Parsers::PostObject).to receive(:call).with(
        post_attributes
      ).and_return(post)

      service = described_class.new(request_options)
      result = service.posts

      expect(result).to eq([post])
      expect(ButterCMS::Parsers::PostObject).to have_received(:call).with(
        post_attributes
      ).once
      expect(ButterCMS::Requests::Get).to have_received(:call).with(
        "posts", request_options
      ).once
    end
  end
end
