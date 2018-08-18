require 'spec_helper'

describe ButterCMS::Post do
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
