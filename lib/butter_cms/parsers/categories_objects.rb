module ButterCMS
  module Parsers
    class CategoriesObjects
      # Returns array of category objects created from given array of attributes
      #
      # @return [Array<ButterCMS::Category>]
      def self.call(categories)
        categories.map do |category_attributes|
          ::ButterCMS::Category.new(category_attributes)
        end
      end

    end
  end
end
