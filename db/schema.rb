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

ActiveRecord::Schema.define(version: 20180509063545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atmospheres", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "humidity"
    t.string "pressure"
    t.string "rising"
    t.string "visibility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_atmospheres_on_weather_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "city"
    t.string "country"
    t.string "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_locations_on_weather_id"
  end

  create_table "weathers", force: :cascade do |t|
    t.string "title", comment: "Page Title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "winds", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "chill"
    t.string "direction"
    t.string "speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_winds_on_weather_id"
  end

  add_foreign_key "atmospheres", "weathers"
  add_foreign_key "locations", "weathers"
  add_foreign_key "winds", "weathers"
end
