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

ActiveRecord::Schema.define(:version => 20130128224559) do

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

  create_table "homes", :force => true do |t|
    t.string   "picture"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "past_projects", :force => true do |t|
    t.string   "title1"
    t.string   "picture1"
    t.text     "description1"
    t.string   "title2"
    t.string   "picture2"
    t.text     "description2"
    t.string   "title3"
    t.string   "picture3"
    t.text     "description3"
    t.string   "title4"
    t.string   "picture4"
    t.text     "description4"
    t.text     "links"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "background"
    t.text     "concept"
    t.text     "design"
    t.text     "skills"
    t.text     "solutions"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.boolean  "nda_required"
    t.boolean  "funding_commitment"
    t.integer  "company_id"
  end

  create_table "semesters", :force => true do |t|
    t.string   "name"
    t.date     "start"
    t.date     "end"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
