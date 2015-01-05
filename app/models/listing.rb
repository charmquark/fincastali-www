class Listing < ActiveRecord::Base
    belongs_to  :category   , class_name: 'ListCategory'                            , inverse_of: :listings , touch: true
    belongs_to  :entity     , class_name: 'ListEntity'                              , inverse_of: :listings , touch: true
    has_one     :image      , class_name: 'ListingImage'    , dependent: :destroy   , inverse_of: :listing

    validates :category,
        presence: true

    validates :entity,
        presence: true
end
