class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.belongs_to :list_category, index: true
      t.belongs_to :list_entity, index: true

      t.timestamps null: false
    end
    add_foreign_key :listings, :list_categories
    add_foreign_key :listings, :list_entities
  end
end
