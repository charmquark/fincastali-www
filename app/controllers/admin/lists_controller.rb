
class Admin::ListsController < Admin::ApplicationController
    def new
        @list = List.new
    end

    def create
        @list = List.new list_params
        if @list.save
            redirect_to admin_list_path(@list)
        else
            render 'new'
        end
    end

    def index
        @lists = List.all
    end

    def show
        find_list
    end

    def edit
        find_list
    end

    def update
        find_list.update list_params
        if @list.save
            redirect_to admin_list_path(@list)
        else
            render 'edit'
        end
    end

    def destroy
        find_list.destroy
        redirect_to admin_lists_path
    end


    private


    def find_list
        @list = List.find params[:id]
    end


    def list_params
        params.require(:list).permit(:name, :description, :short_description, :tag)
    end
end

