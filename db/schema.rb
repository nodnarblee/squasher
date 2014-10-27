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

ActiveRecord::Schema.define(version: 20141022231001) do

  create_table "events", force: true do |t|
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.integer  "match_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.integer  "player_1_id"
    t.integer  "player_2_id"
    t.integer  "player_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "right_left_handed"
    t.integer  "matches_id"
    t.integer  "game_id"
    t.integer  "rallies_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rallies", force: true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "player_1_score"
    t.integer  "player_2_score"
    t.string   "serve_player"
    t.string   "serve_side"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
