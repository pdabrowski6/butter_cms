module ButterCMS
  class PostsFetchService
    def initialize(request_options)
      @request_options = request_options
    end

    def posts
      parser.posts.map do |post_attributes|
        ::ButterCMS::Parsers::PostObject.call(post_attributes)
      end
    end

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
