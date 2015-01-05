
class Admin::ListCategoriesController < Admin::ApplicationController
    def new
        params.require(:list_id)
        @list = List.find params[:list_id]
        @category = ListCategory.new list: @list
    end

    def create
        @category = ListCategory.new category_params
        if @category.save
            redirect_to admin_list_category_path(@category)
        else
            render 'new'
        end
    end

    def show
        @category = ListCategory.find params[:id]
        @list = @category.list
    end

    def edit
        @category = ListCategory.find params[:id]
        @list = @category.list
    end

    def update
        @category = ListCategory.find params[:id]
        @category.update category_params
        if @category.save
            redirect_to admin_list_category_path(@category)
        else
            @list = @category.list
            render 'edit'
        end
    end

    def destroy
    end


    private


    def category_params
        params.require(:list_category).permit(:name, :description, :list_id)
    end
end

