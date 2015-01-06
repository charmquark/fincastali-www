
class Admin::ListCategoriesController < Admin::ApplicationController
    def new
        params.require(:list_id)
        @category = ListCategory.new list: List.find(params[:list_id])
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
        find_category
    end

    def edit
        find_category
    end

    def update
        find_category.update category_params
        if @category.save
            redirect_to admin_list_category_path(@category)
        else
            render 'edit'
        end
    end

    def destroy
        find_category.destroy
        redirect_to admin_list_path(@category.list)
    end


    private


    def category_params
        params.require(:list_category).permit(:name, :description, :list_id)
    end


    def find_category
        @category = ListCategory.find params[:id]
    end
end

