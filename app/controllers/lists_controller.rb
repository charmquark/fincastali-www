
class ListsController < ApplicationController
    before_action :set_common


    def index
        @lists = List.all

        @body_id = 'site-page-lists-index'
    end

    def show
        find_list

        @body_id            = 'site-page-lists-show'
        @include_nav_to_top = true
        @scripts           << 'lists'
        @title             << @list.name
    end


    private


    def find_list
        @list = List.find_by tag: params[:tag]
    end


    def set_common
        @active_site_nav    = :lists
        @title             << 'Lists'
    end
end

