require 'spec_helper'

describe ButterCMS::Requests::Get do
  describe '.call' do
    it 'performs request' do
      options = { page: 1 }
      path = "posts"
      query = "?page=1&auth_token=api_token"
      allow(ButterCMS::UrlParamsService).to receive(:call).with(
        options
      ).and_return(query)
      full_url = "https://api.buttercms.com/v2/posts?page=1&auth_token=api_token"
      response = double('response')
      allow(RestClient).to receive(:get).with(full_url).and_return(response)

      result = described_class.call("posts", options)

      expect(result).to eq(response)
      expect(ButterCMS::UrlParamsService).to have_received(:call).with(
        options
      ).once
      expect(RestClient).to have_received(:get).with(full_url).once
    end
  end
end
