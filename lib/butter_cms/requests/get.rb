require 'rest_client'

module ButterCMS
  module Requests
    class Get

      def self.call(path, options = {})
        full_url = [
          ::ButterCMS::Requests::API::URL,
          path,
          ::ButterCMS::UrlParamsService.call(options)
        ].join

        ::RestClient.get(full_url)
      end

    end
  end
end
