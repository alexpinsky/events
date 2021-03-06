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

ActiveRecord::Schema.define(version: 20160402090645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_requests", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",        limit: 255
    t.string   "url",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state",                   default: 0
    t.integer  "template_id"
    t.jsonb    "information",             default: {}, null: false
    t.jsonb    "texts",                   default: {}, null: false
    t.jsonb    "appearance",              default: {}, null: false
    t.jsonb    "pictures",                default: {}, null: false
  end

  add_index "events", ["appearance"], name: "index_events_on_appearance", using: :gin
  add_index "events", ["information"], name: "index_events_on_information", using: :gin
  add_index "events", ["pictures"], name: "index_events_on_pictures", using: :gin
  add_index "events", ["state"], name: "index_events_on_state", using: :btree
  add_index "events", ["template_id"], name: "index_events_on_template_id", using: :btree
  add_index "events", ["texts"], name: "index_events_on_texts", using: :gin
  add_index "events", ["url"], name: "index_events_on_url", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "image_url",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
    t.integer  "event_id"
  end

  add_index "pictures", ["event_id"], name: "index_pictures_on_event_id", using: :btree

  create_table "templates", force: :cascade do |t|
    t.string  "name"
    t.string  "thumbnail_url"
    t.integer "category_id"
  end

  add_index "templates", ["category_id"], name: "index_templates_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "views", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "ip",         limit: 255
    t.string   "referer",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "views", ["event_id"], name: "index_views_on_event_id", using: :btree

end
