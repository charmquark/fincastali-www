class CreateListCategories < ActiveRecord::Migration
  def change
    create_table :list_categories do |t|
      t.string :name
      t.text :description
      t.belongs_to :list, index: true

      t.timestamps null: false
    end
    add_foreign_key :list_categories, :lists
  end
end
