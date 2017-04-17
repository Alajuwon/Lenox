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

ActiveRecord::Schema.define(version: 20170329163049) do

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "line_item_total"
    t.integer  "order_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "restaurant_item_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal"
    t.decimal  "sales_tax"
    t.decimal  "grand_total"
    t.integer  "guest_id"
    t.text     "order_items"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "restaurant_items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "quantity"
    t.text     "description"
    t.integer  "rating"
    t.integer  "category_id"
    t.integer  "calories"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.integer  "menu_id"
  end

end
