module ButterCMS
  class UrlParamsService

    # Returns the query part of the request to the API
    #
    # @return [String]
    def self.call(options = {})
      options[:auth_token] = ButterCMS.configuration.api_key

      "?" << options.map { |(key, value)| "#{key.to_s}=#{value}" }.join("&")
    end

  end
end
