class Listing < ActiveRecord::Base
    belongs_to  :category   , class_name: 'ListCategory'    , inverse_of: :listings , touch: true
    belongs_to  :entity     , class_name: 'ListEntity'      , inverse_of: :listings , touch: true

    has_attached_file :image,
        default_url:    '/images/lists/default_card_image.jpg',
        url:            "/images/lists/card_images/:id.jpg"

    validates :category,
        presence: true

    validates :entity,
        presence: true

    validates_attachment_content_type :image,
        content_type: /\Aimage\/.*\Z/
end
