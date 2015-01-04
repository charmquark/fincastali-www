
class Admin::ApplicationController < ApplicationController
    before_action :authenticate, :set_common

    layout 'admin'


    private

    def authenticate
        redirect_to admin_login_url unless session[:admin_permission] == true
    end

    def set_common
        @body_id    = 'site-page-admin'
        @title     << 'Admin'

        @logged_in  = session[:admin_permission] == true
    end
end

