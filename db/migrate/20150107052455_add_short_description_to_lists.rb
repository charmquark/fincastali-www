class AddShortDescriptionToLists < ActiveRecord::Migration
  def change
    add_column :lists, :short_description, :string
  end
end
