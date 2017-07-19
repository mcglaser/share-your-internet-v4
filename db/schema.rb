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

ActiveRecord::Schema.define(version: 20170719215755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communities", force: :cascade do |t|
    t.string "community_name"
    t.string "community_address"
    t.string "community_city"
    t.string "community_state"
    t.integer "community_zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "uid"
  end

  create_table "messages", force: :cascade do |t|
    t.text "user_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "referrals", force: :cascade do |t|
    t.string "ref_first_name"
    t.string "ref_last_name"
    t.string "ref_address_line_one"
    t.string "ref_address_line_two"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rolodex_id"
  end

  create_table "referrals_rolodexes", force: :cascade do |t|
    t.integer "referral_id"
    t.integer "rolodex_id"
  end

  create_table "rolodexes", force: :cascade do |t|
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "address_line_one"
    t.string "address_line_two"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.string "internet_type"
    t.string "internet_speed"
    t.decimal "monthly_cost", precision: 8, scale: 2
    t.string "community_name"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "community_id"
  end

end
