# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_21_084850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ar_list_items", force: :cascade do |t|
    t.bigint "furniture_id", null: false
    t.bigint "ar_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ar_list_id"], name: "index_ar_list_items_on_ar_list_id"
    t.index ["furniture_id"], name: "index_ar_list_items_on_furniture_id"
  end

  create_table "ar_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ar_lists_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "furniture_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["furniture_id"], name: "index_cart_items_on_furniture_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "furniture_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["furniture_id"], name: "index_favourites_on_furniture_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "furnitures", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "manufacturer_id", null: false
    t.integer "rating"
    t.integer "dimension_height"
    t.integer "dimension_width"
    t.bigint "theme_id", null: false
    t.boolean "preset"
    t.string "thumbnail_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "poly_id"
    t.index ["manufacturer_id"], name: "index_furnitures_on_manufacturer_id"
    t.index ["theme_id"], name: "index_furnitures_on_theme_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ar_list_items", "ar_lists"
  add_foreign_key "ar_list_items", "furnitures"
  add_foreign_key "ar_lists", "users"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "furnitures"
  add_foreign_key "carts", "users"
  add_foreign_key "favourites", "furnitures"
  add_foreign_key "favourites", "users"
  add_foreign_key "furnitures", "manufacturers"
  add_foreign_key "furnitures", "themes"
end
