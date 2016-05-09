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

ActiveRecord::Schema.define(version: 20160509202113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aggressors", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_survey_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "aggressors", ["user_survey_id"], name: "index_aggressors_on_user_survey_id", using: :btree

  create_table "denouncers", force: :cascade do |t|
    t.string   "email",          default: "", null: false
    t.integer  "gender",         default: 2,  null: false
    t.string   "name"
    t.string   "phone_number"
    t.integer  "user_survey_id",              null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "group_id"
  end

  add_index "denouncers", ["gender"], name: "index_denouncers_on_gender", using: :btree
  add_index "denouncers", ["group_id"], name: "index_denouncers_on_group_id", using: :btree
  add_index "denouncers", ["user_survey_id"], name: "index_denouncers_on_user_survey_id", using: :btree

  create_table "grades", force: :cascade do |t|
    t.string   "title",          null: false
    t.integer  "institution_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "grades", ["institution_id"], name: "index_grades_on_institution_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "grade_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["grade_id"], name: "index_groups_on_grade_id", using: :btree

  create_table "institutions", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "subdomain",                    null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "address",         default: "", null: false
    t.string   "state",           default: "", null: false
    t.string   "municipality",    default: "", null: false
    t.string   "phone",           default: "", null: false
    t.string   "cct",             default: "", null: false
    t.string   "education_level", default: "", null: false
    t.string   "category",        default: "", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "text"
    t.integer  "survey_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "violence_type_id"
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id", using: :btree
  add_index "questions", ["violence_type_id"], name: "index_questions_on_violence_type_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "surveys", force: :cascade do |t|
    t.text     "description"
    t.string   "type_survey"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_survey_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "user_answers", ["question_id"], name: "index_user_answers_on_question_id", using: :btree
  add_index "user_answers", ["user_survey_id"], name: "index_user_answers_on_user_survey_id", using: :btree

  create_table "user_surveys", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "survey_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "state"
    t.integer  "institution_id"
    t.string   "violence_types_array", default: [],              array: true
  end

  add_index "user_surveys", ["institution_id"], name: "index_user_surveys_on_institution_id", using: :btree
  add_index "user_surveys", ["survey_id"], name: "index_user_surveys_on_survey_id", using: :btree
  add_index "user_surveys", ["user_id"], name: "index_user_surveys_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name",                   default: "",    null: false
    t.boolean  "accepted_terms",         default: false, null: false
    t.integer  "gender",                 default: 2,     null: false
    t.integer  "institution_id",                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["gender"], name: "index_users_on_gender", using: :btree
  add_index "users", ["institution_id"], name: "index_users_on_institution_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "victims", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_survey_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "victims", ["user_survey_id"], name: "index_victims_on_user_survey_id", using: :btree

  create_table "violence_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
