class CreateListingImages < ActiveRecord::Migration
  def change
    create_table :listing_images do |t|
      t.string :path
      t.belongs_to :listing, index: true

      t.timestamps null: false
    end
    add_foreign_key :listing_images, :listings
  end
end
