require 'json'

module ButterCMS
  module Parsers
    class Posts

      def initialize(response)
        @response = response
      end

      # Returns the number of the next page or nil if not available
      #
      # @return [String]
      def next_page
        parsed_json['meta']['next_page']
      end

      # Returns the number of the previous page or nil if not available
      #
      # @return [String]
      def previous_page
        parsed_json['meta']['previous_page']
      end

      # Returns the count of existing posts
      #
      # @return [String]
      def count
        parsed_json['meta']['count']
      end

      # Returns array of posts attributes available in the response
      #
      # @return [Array]
      def posts
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
