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

ActiveRecord::Schema.define(version: 20170211233058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commonsource_entries", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.string   "slug"
    t.json     "payload"
    t.integer  "user_id"
    t.string   "author_name"
    t.datetime "published_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["slug"], name: "index_commonsource_entries_on_slug", using: :btree
    t.index ["type"], name: "index_commonsource_entries_on_type", using: :btree
    t.index ["user_id"], name: "index_commonsource_entries_on_user_id", using: :btree
  end

  create_table "commonsource_entry_search_data", force: :cascade do |t|
    t.integer  "entry_id"
    t.string   "attr_name"
    t.tsvector "search_data"
    t.text     "raw_data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["entry_id"], name: "index_commonsource_entry_search_data_on_entry_id", using: :btree
    t.index ["search_data"], name: "idx_search_data", using: :gin
  end

  create_table "commonsource_galleries", force: :cascade do |t|
    t.integer  "commonsource_entry_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["commonsource_entry_id"], name: "index_commonsource_galleries_on_commonsource_entry_id", using: :btree
  end

  create_table "commonsource_images", force: :cascade do |t|
    t.integer  "commonsource_gallery_id"
    t.string   "paperclip_file_name"
    t.string   "paperclip_content_type"
    t.integer  "paperclip_file_size"
    t.datetime "paperclip_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["commonsource_gallery_id"], name: "index_commonsource_images_on_commonsource_gallery_id", using: :btree
  end

  add_foreign_key "commonsource_galleries", "commonsource_entries"
  add_foreign_key "commonsource_images", "commonsource_galleries"
end
