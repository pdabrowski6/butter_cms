module ButterCMS
  class Post < ButterCMS::Resource

    # Returns all available posts from the API
    #
    # @return [Array<ButterCMS::Post>]
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

  end
end
