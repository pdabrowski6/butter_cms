require 'spec_helper'

describe ButterCMS do
  describe 'configuration' do
    it 'allows to set the api_key' do
      described_class.configure do |config|
        config.api_key = 'my_api_key'
      end

      expect(described_class.configuration.api_key).to eq('my_api_key')
    end
  end
end
