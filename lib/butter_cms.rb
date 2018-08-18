require 'butter_cms/configuration'
require 'butter_cms/url_params_service'
require 'butter_cms/requests/api'
require 'butter_cms/requests/get'
require 'butter_cms/parsers/posts'
require 'butter_cms/resource'
require 'butter_cms/author'
require 'butter_cms/parsers/author_object'
require 'butter_cms/category'
require 'butter_cms/parsers/categories_objects'

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
