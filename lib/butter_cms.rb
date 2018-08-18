require 'butter_cms/configuration'
require 'butter_cms/url_params_service'
require 'butter_cms/requests/api'
require 'butter_cms/requests/get'
require 'butter_cms/parsers/posts'
require 'butter_cms/resource'

module ButterCMS
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= ::ButterCMS::Configuration.new

    yield(configuration) if block_given?
  end
end

ButterCMS.configure unless ButterCMS.configuration
