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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130513014158) do

  create_table "approvals", :force => true do |t|
    t.integer  "faculty_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "technical_name"
    t.string   "technical_designation"
    t.string   "technical_email"
    t.string   "technical_phone"
    t.string   "director_name"
    t.string   "director_designation"
    t.string   "director_email"
    t.string   "director_phone"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "faculty_sections", :force => true do |t|
    t.integer  "faculty_id"
    t.integer  "section_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "group_members", :force => true do |t|
    t.integer  "group_id"
    t.integer  "student_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.string   "email"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "headings", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "past_projects", :force => true do |t|
    t.string   "title"
    t.string   "picture"
    t.text     "description"
    t.text     "links"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_schools", :force => true do |t|
    t.integer  "project_id"
    t.integer  "school_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_status_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_statuses", :force => true do |t|
    t.integer  "project_id"
    t.integer  "project_status_type_id"
    t.integer  "semester_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "background"
    t.text     "concept"
    t.text     "design"
    t.text     "skills"
    t.text     "solutions"
    t.boolean  "nda_required"
    t.boolean  "funding_commitment"
    t.integer  "company_id"
    t.string   "form"
    t.integer  "semester_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "proposal_status_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "proposal_statuses", :force => true do |t|
    t.integer  "group_id"
    t.integer  "proposal_status_type_id"
    t.integer  "proposal_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "proposals", :force => true do |t|
    t.integer  "proposal_status_type_id"
    t.integer  "project_id"
    t.integer  "group_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.text     "who"
    t.text     "what"
    t.text     "why"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.integer  "semester_id"
    t.integer  "school_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "semesters", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subheadings", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "texts", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "gtusername"
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "admin"
    t.string   "type"
    t.boolean  "test"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
