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

ActiveRecord::Schema[7.0].define(version: 2024_11_22_120507) do
  create_table "itineraries", charset: "utf8mb3", force: :cascade do |t|
    t.string "location", null: false
    t.date "departure"
    t.date "arrival"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "lists", charset: "utf8mb3", force: :cascade do |t|
    t.string "sightseeing", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "plans", charset: "utf8mb3", force: :cascade do |t|
    t.string "time"
    t.text "content", null: false
    t.bigint "itinerary_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_plans_on_itinerary_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "prepares", charset: "utf8mb3", force: :cascade do |t|
    t.string "item", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_prepares_on_user_id"
  end

  create_table "records", charset: "utf8mb3", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "souvenirs", charset: "utf8mb3", force: :cascade do |t|
    t.string "who", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_souvenirs_on_user_id"
  end

  create_table "spots", charset: "utf8mb3", force: :cascade do |t|
    t.text "suggestion", null: false
    t.bigint "list_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_spots_on_list_id"
    t.index ["user_id"], name: "index_spots_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "itineraries", "users"
  add_foreign_key "lists", "users"
  add_foreign_key "plans", "itineraries"
  add_foreign_key "plans", "users"
  add_foreign_key "prepares", "users"
  add_foreign_key "records", "users"
  add_foreign_key "souvenirs", "users"
  add_foreign_key "spots", "lists"
  add_foreign_key "spots", "users"
end
