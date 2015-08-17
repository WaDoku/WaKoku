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

ActiveRecord::Schema.define(version: 20150817130245) do

  create_table "entries", force: true do |t|
    t.string   "writing"
    t.string   "kana"
    t.string   "romaji"
    t.string   "definition_en"
    t.string   "definition_de"
    t.string   "definition_fr"
    t.text     "textbox_en"
    t.text     "textbox_de"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
