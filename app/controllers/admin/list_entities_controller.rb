
class Admin::ListEntitiesController < Admin::ApplicationController
    def new
        @entity = ListEntity.new
    end

    def create
        @entity = ListEntity.new entity_params
        if @entity.save
            redirect_to admin_list_entity_path(@entity)
        else
            redirect_to 'new'
        end
    end

    def index
        @entities = ListEntity.all
    end

    def show
        @entity = ListEntity.find params[:id]
    end

    def edit
        @entity = ListEntity.find params[:id]
    end

    def update
        @entity = ListEntity.find params[:id]
        @entity.update entity_params
        if @entity.save
            redirect_to admin_list_entity_path(@entity)
        else
            redirect_to 'edit'
        end
    end

    def destroy
        @entity = ListEntity.find params[:id]
    end


    private


    def entity_params
        params.require(:list_entity).permit(:name, :description, :accepts_custom, :urls)
    end
end

