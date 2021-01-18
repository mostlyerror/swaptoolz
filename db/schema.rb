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

ActiveRecord::Schema.define(version: 2021_01_18_194351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "motels", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.string "address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "severe_weather_events", force: :cascade do |t|
    t.date "start", null: false
    t.date "end"
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

  create_table "voucher_applications", force: :cascade do |t|
    t.bigint "severe_weather_event_id"
    t.bigint "user_id"
    t.string "applicant_first_name"
    t.string "applicant_last_name"
    t.date "applicant_date_of_birth"
    t.string "applicant_gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["severe_weather_event_id"], name: "index_voucher_applications_on_severe_weather_event_id"
    t.index ["user_id"], name: "index_voucher_applications_on_user_id"
  end

end
