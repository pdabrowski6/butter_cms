module ButterCMS
  module Parsers
    class Post < ButterCMS::Parsers::Posts
      # Returns post attributes
      #
      # @return [Hash]
      def post
        parsed_json['data']
      end
    end
  end
end
