module ButterCMS
  module Parsers
    class PostObject

      def self.call(post_attributes)
        updated_post_attributes = {
          'tags' => ::ButterCMS::Parsers::TagsObjects.call(post_attributes.delete('tags')),
          'categories' => ::ButterCMS::Parsers::CategoriesObjects.call(post_attributes.delete('categories')),
          'author' => ::ButterCMS::Parsers::AuthorObject.call(post_attributes.delete('author'))
        }

        ::ButterCMS::Post.new(post_attributes.merge(updated_post_attributes))
      end

    end
  end
end
