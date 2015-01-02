class NewsController < ApplicationController
    def index
        @active_site_nav    = :news
        @body_id            = 'site-page-news'
        @title             << 'News'
    end
end
