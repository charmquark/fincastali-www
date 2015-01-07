class ListCategory < ActiveRecord::Base
    belongs_to  :list                                   , inverse_of: :categories   , touch: true
    has_many    :listings   , dependent: :destroy       , inverse_of: :category     , foreign_key: :category_id

    validates :name,
        presence: true

    validates :description,
        presence: true

    validates :list,
        presence: true


    def image_dir
        self.list.image_dir
    end
end
