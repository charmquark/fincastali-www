
class Admin::ApplicationController < ApplicationController
    before_action :authenticate, :set_common

    layout 'admin'


    private

    def authenticate
        if have_admin_permission
            renew_admin_permission
        else
            redirect_to admin_login_url
        end
    end

    def grant_admin_permission
        session[:admin_permission] = true
        renew_admin_permission
    end

    def have_admin_permission
        return false unless session[:admin_permission] === true
        return false if session[:admin_expiration].nil?
        return false unless session[:admin_expiration] > Time.now
        true
    end

    def renew_admin_permission
        session[:admin_expiration] = Time.now + (60 * 60) if session[:admin_permission] == true
    end

    def set_common
        @body_id    = 'site-page-admin'
        @title     << 'Admin'

        @logged_in  = have_admin_permission
    end
end

