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

ActiveRecord::Schema.define(version: 2019_10_10_192653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "lineup_id"
    t.string "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.string "lineup_id"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lineup_players", force: :cascade do |t|
    t.integer "player_id"
    t.integer "lineup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lineups", force: :cascade do |t|
    t.string "name"
    t.string "user_id"
    t.string "formation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.string "fifa_rating"
    t.string "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simulated_lineups", force: :cascade do |t|
    t.string "simulation_id"
    t.string "lineup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simulations", force: :cascade do |t|
    t.string "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "first_lineup_id"
    t.integer "second_lineup_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "club_name"
    t.string "badge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "bio"
    t.string "avatar"
    t.string "team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
