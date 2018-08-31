require 'spec_helper'

describe ButterCMS::Post do
  describe '.find' do
    it 'raises RecordNotFound error when post does not exist for given slug' do
      allow(ButterCMS::Requests::Get).to receive(:call).with("posts/slug").and_raise(RestClient::NotFound)

      expect { described_class.find("slug") }.to raise_error(ButterCMS::Post::RecordNotFound)
    end

    it 'returns post for the given slug' do
      response = double('response')
      post_attributes = { "slug" => "some-slug" }
      post_object = instance_double(ButterCMS::Post)
      allow(ButterCMS::Requests::Get).to receive(:call).with("posts/slug").and_return(response)
      parser = instance_double(ButterCMS::Parsers::Post, post: post_attributes)
      allow(ButterCMS::Parsers::Post).to receive(:new).with(response).and_return(parser)
      allow(ButterCMS::Parsers::PostObject).to receive(:call).with(post_attributes).and_return(post_object)

      result = described_class.find("slug")

      expect(result).to eq(post_object)
      expect(ButterCMS::Parsers::PostObject).to have_received(:call).with(post_attributes).once
      expect(ButterCMS::Requests::Get).to have_received(:call).with("posts/slug").once
    end
  end

  describe '.all' do
    it 'returns all available posts' do
      request_options = { page_size: 10, page: 1 }
      post = instance_double(ButterCMS::Post)
      fetch_service = instance_double(ButterCMS::PostsFetchService,
        posts: [post], more_posts?: true
      )
      allow(ButterCMS::PostsFetchService).to receive(:new).with(
        request_options
      ).and_return(fetch_service)

      another_post = instance_double(ButterCMS::Post)
      another_request_options = { page_size: 10, page: 2 }
      another_fetch_service = instance_double(ButterCMS::PostsFetchService,
        posts: [another_post], more_posts?: false
      )
      allow(ButterCMS::PostsFetchService).to receive(:new).with(
        another_request_options
      ).and_return(another_fetch_service)

      expect(described_class.all).to eq([post, another_post])
    end
  end
end
