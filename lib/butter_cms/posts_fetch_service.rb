module ButterCMS
  class PostsFetchService
    def initialize(request_options)
      @request_options = request_options
    end

    # Returns array of post objects with the associated records included
    #
    # @return [Array<ButterCMS::Post>]
    def posts
      parser.posts.map do |post_attributes|
        ::ButterCMS::Parsers::PostObject.call(post_attributes)
      end
    end

    # Returns true if the next page is available, false otherwise
    #
    # @return [Boolean]
    def more_posts?
      !parser.next_page.nil?
    end

    private

    attr_reader :request_options

    def response
      ::ButterCMS::Requests::Get.call("posts", request_options)
    end

    def parser
      @parser ||= ::ButterCMS::Parsers::Posts.new(response)
    end
  end
end
