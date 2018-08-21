module ButterCMS
  class Category < ButterCMS::Resource

    # Returns all categories
    #
    # @return [Array<ButterCMS::Category>]
    def self.all
      response = ::ButterCMS::Requests::Get.call("categories")
      attributes = ::ButterCMS::Parsers::Categories.new(response).categories

      ::ButterCMS::Parsers::CategoriesObjects.call(attributes)
    end

  end
end
