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

ActiveRecord::Schema.define(version: 20150322003801) do

  create_table "activities", force: :cascade do |t|
    t.boolean  "status"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activities", ["course_id"], name: "index_activities_on_course_id"
  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "class_students", force: :cascade do |t|
    t.string   "name"
    t.integer  "count"
    t.string   "address"
    t.string   "specialized"
    t.datetime "start_year"
    t.datetime "end_year"
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
    t.boolean  "status",           default: true
    t.string   "teacher"
    t.integer  "subject_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scopes", force: :cascade do |t|
    t.integer "semester"
    t.string  "subject_id"
    t.integer "count"
    t.integer "class_student_id"
    t.integer "user_id"
    t.integer "course_id"
    t.float   "middle_scope"
    t.float   "end_scope"
    t.string  "letter"
  end

  create_table "subjects", force: :cascade do |t|
    t.integer  "faculty_id"
    t.integer  "count"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "email"
    t.datetime "start_date"
    t.datetime "birth_day"
    t.integer  "faculty_id"
    t.boolean  "admin"
    t.integer  "class_student_id"
  end

end
