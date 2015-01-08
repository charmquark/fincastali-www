
class Admin::ListEntitiesController < Admin::ApplicationController
    def new
        @entity = ListEntity.new
    end

    def create
        @entity = ListEntity.new entity_params
        if @entity.save
            redirect_to admin_list_entity_path(@entity)
        else
            render 'new'
        end
    end

    def index
        @entities = ListEntity.order :name
    end

    def show
        find_entity
    end

    def edit
        find_entity
    end

    def update
        find_entity.update entity_params
        if @entity.save
            redirect_to admin_list_entity_path(@entity)
        else
            render 'edit'
        end
    end

    def destroy
        find_entity.destroy
        redirect_to admin_list_entities_path
    end


    private


    def entity_params
        params.require(:list_entity).permit(:name, :description, :accepts_custom, :urls)
    end


    def find_entity
        @entity = ListEntity.find params[:id]
    end
end

