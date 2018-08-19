require 'rest_client'

module ButterCMS
  module Requests
    class Get

      # Returns response from the request to the given API endpoint
      #
      # @return [RestClient::Response]
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
