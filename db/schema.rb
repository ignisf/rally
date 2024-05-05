# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_05_230259) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "route_points", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "treasure_id", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id", "treasure_id", "position"], name: "index_route_points_on_team_id_and_treasure_id_and_position", unique: true
    t.index ["team_id"], name: "index_route_points_on_team_id"
    t.index ["treasure_id"], name: "index_route_points_on_treasure_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.uuid "code", default: -> { "gen_random_uuid()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_teams_on_code", unique: true
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  create_table "treasure_discoveries", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "treasure_id", null: false
    t.timestamptz "discovered_at", null: false
    t.timestamptz "skipped_at"
    t.timestamptz "answered_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id", "treasure_id"], name: "index_treasure_discoveries_on_team_id_and_treasure_id", unique: true
    t.index ["team_id"], name: "index_treasure_discoveries_on_team_id"
    t.index ["treasure_id"], name: "index_treasure_discoveries_on_treasure_id"
  end

  create_table "treasures", force: :cascade do |t|
    t.text "hint", null: false
    t.text "question", null: false
    t.text "answer", null: false
    t.uuid "code", default: -> { "gen_random_uuid()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_treasures_on_code", unique: true
  end

  add_foreign_key "route_points", "teams"
  add_foreign_key "route_points", "treasures"
  add_foreign_key "treasure_discoveries", "teams"
  add_foreign_key "treasure_discoveries", "treasures"
end
