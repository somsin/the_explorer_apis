# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150131104233) do

  create_table "addresses", force: true do |t|
    t.string   "country"
    t.string   "city"
    t.string   "state"
    t.string   "street"
    t.integer  "pincode"
    t.text     "landmark"
    t.decimal  "latitude",    precision: 10, scale: 8
    t.decimal  "longitude",   precision: 10, scale: 8
    t.string   "mobile_no"
    t.integer  "merchant_id"
    t.binary   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", force: true do |t|
    t.text     "title"
    t.integer  "logo_id"
    t.text     "banner_ids"
    t.text     "description"
    t.date     "start_at"
    t.date     "end_at"
    t.integer  "merchant_id"
    t.decimal  "price",       precision: 10, scale: 0
    t.string   "discount"
    t.integer  "avail_count"
    t.integer  "sold_count"
    t.string   "deal_type"
    t.binary   "uuid"
    t.boolean  "event_flag"
    t.string   "name"
    t.string   "logo_image"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.text     "title"
    t.integer  "deal_id"
    t.date     "start_at"
    t.date     "end_at"
    t.integer  "logo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.text     "name"
    t.integer  "deal_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: true do |t|
    t.string   "email_address"
    t.string   "name"
    t.integer  "address_id"
    t.date     "expire_at"
    t.string   "merchant_type"
    t.binary   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "deal_id"
    t.integer  "deal_count"
    t.boolean  "is_redeem"
    t.text     "voucher_code"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_subscribers", force: true do |t|
    t.integer  "purchase"
    t.date     "expire_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email_address"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "status"
    t.binary   "uuid"
    t.string   "mobile_no"
    t.string   "device_id"
    t.string   "pin_code"
    t.boolean  "email_promotional"
    t.string   "signup_code"
    t.boolean  "session_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
