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

ActiveRecord::Schema.define(version: 20140724163417) do

  create_table "close_answers", force: true do |t|
    t.string   "value"
    t.boolean  "checked"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuestionaries", force: true do |t|
    t.string   "title"
    t.string   "call_code"
    t.text     "instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "institutions", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "tokenspecialforms"
    t.string   "tokenspecialviews"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "phone"
    t.integer  "extencion"
  end

  create_table "open_answers", force: true do |t|
    t.text     "value"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "title"
    t.integer  "cuestionary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "question_type"
    t.text     "question_requires"
  end

  create_table "red_lights", force: true do |t|
    t.string   "mail"
    t.string   "name"
    t.string   "institution_code"
    t.string   "type_denunce"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "history"
    t.text     "aggressors"
    t.boolean  "question_1",       default: false
    t.boolean  "question_2",       default: false
    t.boolean  "question_3",       default: false
    t.boolean  "question_4",       default: false
    t.boolean  "question_5",       default: false
    t.boolean  "question_6",       default: false
    t.boolean  "question_7",       default: false
    t.boolean  "question_8",       default: false
    t.boolean  "question_9",       default: false
    t.boolean  "question_10",      default: false
    t.boolean  "question_11",      default: false
    t.boolean  "question_12",      default: false
    t.boolean  "question_13",      default: false
    t.boolean  "question_14",      default: false
    t.boolean  "question_15",      default: false
    t.boolean  "question_16",      default: false
    t.boolean  "question_17",      default: false
    t.boolean  "question_18",      default: false
    t.boolean  "question_19",      default: false
    t.boolean  "question_20",      default: false
  end

  create_table "subscribers", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "charge"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "terms_of_service"
    t.string   "salt"
    t.boolean  "confirmation",     default: false
    t.integer  "confirmed_by"
    t.boolean  "admin_attributes", default: false
  end

end
