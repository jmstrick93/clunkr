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

ActiveRecord::Schema.define(version: 20171109230549) do

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_type_cars", force: :cascade do |t|
    t.integer "car_type_id"
    t.integer "car_id"
  end

  create_table "car_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.integer "brand_id"
    t.integer "year"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.integer "resource_type_id"
    t.integer "car_id"
    t.string "source_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_cars", force: :cascade do |t|
    t.integer "car_id"
    t.integer "user_id"
    t.string "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
