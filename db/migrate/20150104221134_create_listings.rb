class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.belongs_to :category, index: true
      t.belongs_to :entity, index: true

      t.timestamps null: false
    end
    add_foreign_key :listings, :list_categories, column: :category_id
    add_foreign_key :listings, :list_entities, column: :entity_id
  end
end
