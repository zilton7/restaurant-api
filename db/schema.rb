# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_06_002150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "all_restaurants", force: :cascade do |t|
    t.string "name"
    t.datetime "opening_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "collection_id", null: false
    t.index ["collection_id"], name: "index_all_restaurants_on_collection_id"
    t.index ["user_id"], name: "index_all_restaurants_on_user_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "vegetarian_favorites"
    t.string "meat_lovers"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "all_restaurants", "collections"
  add_foreign_key "all_restaurants", "users"
  add_foreign_key "collections", "users"
end
