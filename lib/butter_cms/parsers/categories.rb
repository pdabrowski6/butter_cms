require 'json'

module ButterCMS
  module Parsers
    class Categories

      def initialize(response)
        @response = response
      end

      # Returns array of category attributes available in the response
      #
      # @return [Array]
      def categories
        parsed_json['data']
      end

      private

      attr_reader :response

      def parsed_json
        @parsed_json ||= ::JSON.parse(response.body)
      end
    end
  end
end
