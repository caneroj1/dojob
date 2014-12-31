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

ActiveRecord::Schema.define(version: 20141230234906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "username"
    t.string   "avatar"
  end

  create_table "contacts", force: true do |t|
    t.integer  "contact_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_name"
  end

  create_table "hard_offers", force: true do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "date_of_job"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "accepted"
    t.string   "avatar"
    t.integer  "offer_id"
    t.boolean  "completed"
  end

  create_table "jobs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "frequency"
    t.datetime "deadline"
    t.string   "where"
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "accepted"
    t.integer  "accepted_by"
    t.datetime "accepted_on"
    t.boolean  "completed"
    t.datetime "completed_on"
    t.integer  "completed_by"
  end

  create_table "jobs_tags", id: false, force: true do |t|
    t.integer  "job_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", force: true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "accepted"
    t.boolean  "completed"
    t.string   "made_by"
  end

  create_table "references", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_number"
    t.string   "contact_email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "tag_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "address"
    t.boolean  "paid",                   default: false
    t.text     "childcare_survey"
    t.text     "petcare_survey"
    t.text     "tutoring_survey"
    t.text     "availability"
    t.text     "handyman_survey"
    t.text     "about_me"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
