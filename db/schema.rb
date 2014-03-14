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

ActiveRecord::Schema.define(:version => 20140314121338) do

  create_table "area", :force => true do |t|
    t.string "name",    :limit => 120, :null => false
    t.text   "sources",                :null => false
  end

  add_index "area", ["name"], :name => "area_name_key", :unique => true

  create_table "job", :force => true do |t|
    t.integer  "area"
    t.integer  "office"
    t.string   "uri",    :limit => 1024, :null => false
    t.datetime "date",                   :null => false
    t.string   "title",  :limit => 1024, :null => false
  end

  add_index "job", ["uri"], :name => "job_uri_key", :unique => true

  create_table "office", :force => true do |t|
    t.string "name", :limit => 120, :null => false
  end

  add_index "office", ["name"], :name => "office_name_key", :unique => true

end
