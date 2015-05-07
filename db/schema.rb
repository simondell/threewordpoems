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

ActiveRecord::Schema.define(version: 20150507124340) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colourways", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poem_categories", force: true do |t|
    t.integer  "poem_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "poem_categories", ["category_id"], name: "index_poem_categories_on_category_id"
  add_index "poem_categories", ["poem_id"], name: "index_poem_categories_on_poem_id"

  create_table "poems", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "poet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_id"
    t.integer  "colourway_id"
    t.string   "image"
    t.integer  "workflow_step", default: 0
    t.boolean  "maximised",     default: true
    t.text     "keywords"
  end

  create_table "poets", force: true do |t|
    t.string   "display_name"
    t.string   "email"
    t.string   "passwordhash"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
