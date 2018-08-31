module ButterCMS
  class Post < ButterCMS::Resource
    class RecordNotFound < StandardError; end
    # Returns post for given slug if available otherwise raises error RecordNotFound
    #
    # @return [ButterCMS::Post]
    def self.all
      posts = []
      request_options = { page_size: 10, page: 0 }
      more_posts = true

      while more_posts
        request_options = request_options.merge(page: request_options[:page] + 1)
        fetch_service = ButterCMS::PostsFetchService.new(request_options)
        posts = posts | fetch_service.posts
        more_posts = fetch_service.more_posts?
      end

      posts
    end

    # Returns all available posts from the API
    #
    # @return [ButterCMS::Post]
    def self.find(slug)
      response = ::ButterCMS::Requests::Get.call("posts/#{slug}")
      post_attributes = ::ButterCMS::Parsers::Post.new(response).post
      ::ButterCMS::Parsers::PostObject.call(post_attributes)
    rescue RestClient::NotFound
      raise RecordNotFound
    end

  end
end
