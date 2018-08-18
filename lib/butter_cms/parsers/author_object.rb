module ButterCMS
  module Parsers
    class AuthorObject

      def self.call(author)
        ::ButterCMS::Author.new(author)
      end

    end
  end
end
