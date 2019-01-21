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

ActiveRecord::Schema.define(version: 20190121040215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.integer "postful_code"
    t.string "city"
    t.string "town"
    t.integer "adress"
    t.string "after_adress"
    t.integer "property_age"
    t.integer "rent"
    t.string "floor_space"
    t.string "floor_plan"
    t.string "encount_monster"
    t.integer "stop_count"
    t.string "stop_adress"
    t.text "floor_plan_image"
  end

end
