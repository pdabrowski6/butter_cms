require 'spec_helper'

describe ButterCMS::Configuration do
  describe 'initialization' do
    it 'sets default value for the api_key attribute' do
      configuration = described_class.new
      expect(configuration.api_key).to eq('PLEASE PROVIDE VALID API KEY')
    end
  end
end
