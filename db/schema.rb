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

ActiveRecord::Schema.define(version: 20141205143757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appearances", force: true do |t|
    t.string   "background_image"
    t.string   "font_family_1"
    t.string   "font_color_1"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "font_size_1"
    t.string   "font_family_2"
    t.string   "font_color_2"
    t.integer  "font_size_2"
    t.string   "font_family_3"
    t.string   "font_color_3"
    t.integer  "font_size_3"
    t.string   "font_family_4"
    t.string   "font_color_4"
    t.integer  "font_size_4"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "text_1"
    t.string   "text_2"
    t.text     "text_3"
    t.string   "url"
    t.string   "url_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "theme_id"
    t.boolean  "is_theme"
    t.string   "preview_url"
    t.string   "text_4"
  end

  create_table "information", force: true do |t|
    t.integer  "event_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "time_zone"
    t.string   "summary"
    t.string   "location"
    t.string   "organizer"
    t.string   "organizer_email"
    t.string   "date_format"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "in_use"
  end

  create_table "pictures", force: true do |t|
    t.integer  "displayable_id"
    t.string   "displayable_type"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "image_processing"
    t.boolean  "slideshow"
    t.integer  "order"
  end

  create_table "songs", force: true do |t|
    t.integer  "listenable_id"
    t.string   "listenable_type"
    t.string   "audio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
