
class Admin::ListingsController < Admin::ApplicationController
    def new
        params.permit(:list_category_id, :list_entity_id)
        @listing            = Listing       .new
        @listing.category   = ListCategory  .find params[:list_category_id] unless params[:list_category_id].nil?
        @listing.entity     = ListEntity    .find params[:list_entity_id  ] unless params[:list_entity_id  ].nil?
    end

    def create
        @listing = Listing.new listing_params
        if @listing.save
            selective_redirect
        else
            render 'new'
        end
    end

    def edit
        find_listing
    end

    def update
        find_listing.update listing_params
        if @listing.save
            selective_redirect
        else
            render 'edit'
        end
    end

    def destroy
        find_listing.destroy
        selective_redirect
    end


    private


    def find_listing
        @listing = Listing.find params[:id]
    end


    def listing_params
        params.require(:listing).permit(:category_id, :entity_id)
    end


    def selective_redirect
        unless params[:list_category_id].nil?
            redirect_to admin_list_category_path(@listing.category)
        else
            redirect_to admin_list_entity_path(@listing.entity)
        end
    end
end

