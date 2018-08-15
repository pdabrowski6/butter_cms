require 'butter_cms/configuration'

module ButterCMS
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= ::ButterCMS::Configuration.new
    
    yield(configuration)
  end
end
