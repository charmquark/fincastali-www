class CreateListEntities < ActiveRecord::Migration
  def change
    create_table :list_entities do |t|
      t.string :name
      t.text :description
      t.boolean :accepts_custom
      t.text :urls

      t.timestamps null: false
    end
  end
end
