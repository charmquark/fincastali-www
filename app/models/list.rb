class List < ActiveRecord::Base
    has_many    :categories , class_name: 'ListCategory'    , dependent: :destroy   , inverse_of: :list
    has_many    :listings                                   , through: :categories

    validates :name,
        presence: true

    validates :tag,
        presence: true,
        uniqueness: true

    validates :description,
        presence: true

    validates :short_description,
        presence: true
end
