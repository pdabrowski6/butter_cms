module ButterCMS
  module Parsers
    class TagsObjects

      def self.call(tags)
        tags.map do |tag_attributes|
          ::ButterCMS::Tag.new(tag_attributes)
        end
      end

    end
  end
end
