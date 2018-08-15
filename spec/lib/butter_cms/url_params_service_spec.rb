require 'spec_helper'

describe ButterCMS::UrlParamsService do
  describe '.call' do
    it 'returns query string with the auth_token param' do
      api_key = 'api_key'
      allow(ButterCMS.configuration).to receive(:api_key).and_return(api_key)
      options = { page: 1, per_page: 10 }

      expect(described_class.call(
        options
      )).to eq("?page=1&per_page=10&auth_token=api_key")
    end

    it 'returns query string with the auth_token param when given options are blank' do
      api_key = 'api_key'
      allow(ButterCMS.configuration).to receive(:api_key).and_return(api_key)

      expect(described_class.call).to eq("?auth_token=api_key")
    end
  end
end
