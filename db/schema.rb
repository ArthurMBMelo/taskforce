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

ActiveRecord::Schema.define(version: 2023_04_14_174053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "monthly_totals", force: :cascade do |t|
    t.date "date"
    t.integer "total_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_monthly_totals_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "amount"
    t.float "completion_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "monthly_total_id"
    t.bigint "user_id"
    t.index ["monthly_total_id"], name: "index_tasks_on_monthly_total_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "monthly_totals", "users"
  add_foreign_key "tasks", "monthly_totals"
  add_foreign_key "tasks", "users"
end
