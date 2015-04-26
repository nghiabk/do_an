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

ActiveRecord::Schema.define(version: 20150426032217) do

  create_table "activities", force: :cascade do |t|
    t.integer  "credit"
    t.integer  "day"
    t.time     "start_period"
    t.time     "end_period"
    t.integer  "semester"
    t.boolean  "again",        default: false
    t.integer  "subject_id"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "activities", ["course_id"], name: "index_activities_on_course_id"
  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "class_students", force: :cascade do |t|
    t.string   "name"
    t.integer  "count"
    t.string   "address"
    t.string   "specialized"
    t.string   "start_year"
    t.string   "end_year"
    t.integer  "semester"
    t.integer  "faculty_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "class_students", ["faculty_id"], name: "index_class_students_on_faculty_id"

  create_table "courses", force: :cascade do |t|
    t.integer  "faculty_id"
    t.integer  "semester"
    t.integer  "class_student_id"
    t.integer  "max"
    t.integer  "min"
    t.integer  "count"
    t.boolean  "state",            default: true
    t.string   "address"
    t.integer  "start_week"
    t.integer  "end_week"
    t.integer  "day"
    t.integer  "start_period"
    t.integer  "end_period"
    t.integer  "subject_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "disciplines", force: :cascade do |t|
    t.integer  "level"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "disciplines", ["user_id"], name: "index_disciplines_on_user_id"

  create_table "faculties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fees", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "semester"
    t.integer  "cost",         default: 100000
    t.integer  "total_credit"
    t.integer  "total_money"
    t.boolean  "submit_fee",   default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "released_on"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "programs", force: :cascade do |t|
    t.integer  "semester"
    t.integer  "class_student_id"
    t.integer  "subject_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "programs", ["class_student_id"], name: "index_programs_on_class_student_id"
  add_index "programs", ["subject_id"], name: "index_programs_on_subject_id"

  create_table "requests", force: :cascade do |t|
    t.string   "class_name"
    t.integer  "class_student_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "semester"
    t.integer  "credit"
    t.integer  "course_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.integer  "faculty_id"
    t.integer  "credit"
    t.string   "name"
    t.integer  "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_scores", force: :cascade do |t|
    t.float    "middle_score"
    t.float    "end_score"
    t.float    "finish_score"
    t.integer  "semester"
    t.integer  "credit"
    t.boolean  "again"
    t.integer  "activity_id"
    t.integer  "user_id"
    t.integer  "score_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "table_scores", ["score_id"], name: "index_table_scores_on_score_id"
  add_index "table_scores", ["user_id"], name: "index_table_scores_on_user_id"

  create_table "total_scores", force: :cascade do |t|
    t.integer  "semester"
    t.integer  "semester_credit"
    t.float    "semester_score"
    t.float    "cpa"
    t.float    "gpa"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "total_scores", ["user_id"], name: "index_total_scores_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "email"
    t.date     "start_year"
    t.date     "birth_day"
    t.boolean  "admin"
    t.integer  "faculty_id"
    t.integer  "class_student_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "users", ["class_student_id"], name: "index_users_on_class_student_id"
  add_index "users", ["faculty_id"], name: "index_users_on_faculty_id"

end
