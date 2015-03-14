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

ActiveRecord::Schema.define(version: 20150314095102) do

  create_table "classes", force: true do |t|
    t.string   "name"
    t.integer  "count"
    t.integer  "faculty_id"
    t.string   "address"
    t.string   "specialized"
    t.datetime "start_year"
    t.datetime "end_year"
    t.integer  "semester"
  end

  create_table "courses", force: true do |t|
    t.integer  "faculty_id"
    t.string   "name"
    t.integer  "semester"
    t.integer  "class_id"
    t.integer  "max"
    t.integer  "count"
    t.boolean  "status"
    t.string   "teacher"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faculties", force: true do |t|
    t.string "name"
  end

  create_table "scopes", force: true do |t|
    t.integer "semester"
    t.string  "subject_id"
    t.integer "count"
    t.integer "class_id"
    t.float   "middle_scope"
    t.float   "end_scope"
    t.string  "letter"
    t.integer "user_id"
    t.integer "course_id"
  end

  create_table "subjects", force: true do |t|
    t.integer "faculty_id"
    t.string  "name"
  end

  create_table "users", force: true do |t|
    t.integer  "mssv"
    t.string   "password_digest"
    t.string   "name"
    t.string   "remember_digest"
    t.datetime "start_date"
    t.string   "email"
    t.integer  "faculty_id"
    t.integer  "class_id"
    t.datetime "birth_day"
    t.boolean  "admin"
  end

end
