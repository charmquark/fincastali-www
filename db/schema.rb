# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150104221134) do

  create_table "list_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "list_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "list_categories", ["list_id"], name: "index_list_categories_on_list_id"

  create_table "list_entities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "accepts_custom"
    t.text     "urls"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "listing_images", force: :cascade do |t|
    t.string   "path"
    t.integer  "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "listing_images", ["listing_id"], name: "index_listing_images_on_listing_id"

  create_table "listings", force: :cascade do |t|
    t.integer  "list_category_id"
    t.integer  "list_entity_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "listings", ["list_category_id"], name: "index_listings_on_list_category_id"
  add_index "listings", ["list_entity_id"], name: "index_listings_on_list_entity_id"

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "tag"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lists", ["tag"], name: "index_lists_on_tag", unique: true

end
