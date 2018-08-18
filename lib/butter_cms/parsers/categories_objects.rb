module ButterCMS
  module Parsers
    class CategoriesObjects

      def self.call(categories)
        categories.map do |category_attributes|
          ::ButterCMS::Category.new(category_attributes)
        end
      end

    end
  end
end
