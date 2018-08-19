module ButterCMS
  module Parsers
    class AuthorObject
      # Returns the new instance of author object from the given attributes
      #
      # @return [ButterCMS::Author]
      def self.call(author)
        ::ButterCMS::Author.new(author)
      end

    end
  end
end
