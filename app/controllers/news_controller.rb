class NewsController < ApplicationController
    before_action -> do
        @scripts << 'news'
    end


    def index
        @active_site_nav    = :news
        @body_id            = 'site-page-news'
        @include_nav_to_top = true
        @title             << 'News'

        client = Tumblr::Client.new
        @posts = client.posts('fincastali-hearth.tumblr.com', limit: 5)['posts']
    end
end
