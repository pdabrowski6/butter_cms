module ButterCMS
  module Parsers
    class TagsObjects
      # Returns array of tag objects created from given array of attributes
      #
      # @return [Array<ButterCMS::Tag>]
      def self.call(tags)
        tags.map do |tag_attributes|
          ::ButterCMS::Tag.new(tag_attributes)
        end
      end

    end
  end
end
