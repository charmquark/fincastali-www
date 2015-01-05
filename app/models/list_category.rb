class ListCategory < ActiveRecord::Base
    belongs_to  :list                                   , inverse_of: :categories   , touch: true
    has_many    :listings   , dependent: :destroy       , inverse_of: :category

    validates :name,
        presence: true

    validates :description,
        presence: true

    validates :list,
        presence: true
end
