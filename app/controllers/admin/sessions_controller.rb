
class Admin::SessionsController < Admin::ApplicationController
    skip_before_action :authenticate, only: [:new, :create]


    def new
        @body_id += '-session-new'
    end

    def create
        session[:admin_permission] = false
        if Admin.check_password(params[:password])
            grant_admin_permission
            redirect_to admin_root_url
        else
            redirect_to admin_login_url
        end
    end

    def index
    end

    def destroy
        session[:admin_permission] = false
        redirect_to root_url
    end
end

