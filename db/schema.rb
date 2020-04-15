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

ActiveRecord::Schema.define(version: 2020_04_15_120746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ketchups", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "user_id"
    t.date "date"
    t.time "start_time"
    t.float "duration"
    t.string "message"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.index ["trip_id"], name: "index_ketchups_on_trip_id"
    t.index ["user_id"], name: "index_ketchups_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "ketchup_id"
    t.bigint "trip_id"
    t.bigint "user_id"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ketchup_id"], name: "index_notifications_on_ketchup_id"
    t.index ["trip_id"], name: "index_notifications_on_trip_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "user_id"
    t.date "start_date"
    t.date "end_date"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
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

  add_foreign_key "ketchups", "trips"
  add_foreign_key "ketchups", "users"
  add_foreign_key "notifications", "ketchups"
  add_foreign_key "notifications", "trips"
  add_foreign_key "notifications", "users"
  add_foreign_key "trips", "users"
end
