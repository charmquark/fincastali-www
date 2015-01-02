
class StaticController < ApplicationController
    def home
        @active_site_nav  = :home
        @body_id          = 'site-page-home'

        @slider_max = 7
    end


    def heathenry
        @active_site_nav  = :heathenry
        @body_id          = 'site-page-heathenry'
        @title           << 'Heathenry'

        pcat    = params[:category]
        pname   = params[:name]
        if pcat.present? && pname.present?
            category    = HeathenryCollection.instance[pcat.to_sym]
            article     = category[pname.to_sym]

            @body_id            += '-article'
            @include_nav_to_top  = true
            @title              << article.title

            @active_article = article.key

            render "static/#{category.key}/#{article.key}.html.erb"
        end
    end
end

