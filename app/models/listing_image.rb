class ListingImage < ActiveRecord::Base
    belongs_to  :listing    , inverse_of: :image    , touch: true

    validates :path,
        presence: true

    validates :listing,
        presence: true
end
