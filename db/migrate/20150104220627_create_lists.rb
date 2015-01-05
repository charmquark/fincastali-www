class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :description
      t.string :tag

      t.timestamps null: false
    end
    add_index :lists, :tag, unique: true
  end
end
