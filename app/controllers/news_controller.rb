class NewsController < ApplicationController
    def index
        @active_site_nav    = :news
        @body_id            = 'site-page-news'
        @title             << 'News'

        client = Tumblr::Client.new
        @posts = client.posts('fincastali-hearth.tumblr.com', limit: 5)['posts']
    end
end
