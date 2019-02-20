class InitSchema < ActiveRecord::Migration[4.2]
  def up
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    create_table "contacts" do |t|
      t.string "name"
      t.string "email"
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "encounts" do |t|
      t.integer "property_id"
      t.integer "report_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "favorites" do |t|
      t.integer "user_id"
      t.integer "property_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "properties" do |t|
      t.string "name"
      t.integer "postful_code"
      t.string "town"
      t.string "after_adress"
      t.integer "property_age"
      t.integer "rent"
      t.string "encount_monster"
      t.integer "stop_count"
      t.string "stop_adress"
      t.integer "postful_code_after"
      t.bigint "user_id"
      t.json "images"
      t.string "city"
      t.string "floor_space"
      t.string "floor_plan"
      t.index ["user_id"], name: "index_properties_on_user_id"
    end
    create_table "reports" do |t|
      t.string "title"
      t.string "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "town"
      t.integer "adress"
      t.bigint "user_id"
      t.text "image"
      t.integer "city", limit: 2, default: 0, null: false
      t.index ["user_id"], name: "index_reports_on_user_id"
    end
    create_table "users" do |t|
      t.string "name"
      t.string "email"
      t.string "password_digest"
      t.integer "age"
      t.string "sex"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean "admin", default: false, null: false
      t.index ["email"], name: "index_users_on_email", unique: true
    end
    add_foreign_key "properties", "users"
    add_foreign_key "reports", "users"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
