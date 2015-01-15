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

ActiveRecord::Schema.define(version: 20150115011914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dormitories", force: :cascade do |t|
    t.text     "address_country"
    t.text     "address_city"
    t.text     "address_postal_code"
    t.text     "address_street_name"
    t.text     "address_street_number"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "machines", force: :cascade do |t|
    t.text     "label"
    t.text     "notes"
    t.integer  "dormitory_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "machines", ["dormitory_id"], name: "index_machines_on_dormitory_id", using: :btree

  create_table "user_machine_sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "machine_id"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "user_machine_sessions", ["machine_id"], name: "index_user_machine_sessions_on_machine_id", using: :btree
  add_index "user_machine_sessions", ["user_id"], name: "index_user_machine_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "room"
    t.integer  "dormitory_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "users", ["dormitory_id"], name: "index_users_on_dormitory_id", using: :btree
  add_index "users", ["room", "dormitory_id"], name: "index_users_on_room_and_dormitory_id", unique: true, using: :btree

  create_table "washing_machines", force: :cascade do |t|
    t.text     "label"
    t.text     "notes"
    t.integer  "dormitory_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "washing_machines", ["dormitory_id"], name: "index_washing_machines_on_dormitory_id", using: :btree

  add_foreign_key "machines", "dormitories"
  add_foreign_key "user_machine_sessions", "machines"
  add_foreign_key "user_machine_sessions", "users"
  add_foreign_key "users", "dormitories"
  add_foreign_key "washing_machines", "dormitories"
end
