require 'json'

module ButterCMS
  module Parsers
    class Posts

      def initialize(response)
        @response = response
      end

      def next_page
        parsed_json['meta']['next_page']
      end

      def previous_page
        parsed_json['meta']['previous_page']
      end

      def count
        parsed_json['meta']['count']
      end

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
