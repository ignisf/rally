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

ActiveRecord::Schema[7.1].define(version: 2024_05_11_094645) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "route_points", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "treasure_id", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 0, null: false
    t.timestamptz "discovered_at"
    t.index ["discovered_at"], name: "index_route_points_on_discovered_at"
    t.index ["state"], name: "index_route_points_on_state"
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

  create_table "treasures", force: :cascade do |t|
    t.text "name", null: false
    t.text "hint", null: false
    t.text "question", null: false
    t.text "answer", null: false
    t.uuid "code", default: -> { "gen_random_uuid()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_treasures_on_code", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "route_points", "teams"
  add_foreign_key "route_points", "treasures"

  create_view "final_standings_entries", sql_definition: <<-SQL
      WITH classification_entries AS (
           SELECT teams.id AS team_id,
              count(discovered_route_points.id) AS discovered_treasures,
              max(discovered_route_points.discovered_at) AS last_treasure_discovered_at
             FROM (teams
               LEFT JOIN route_points discovered_route_points ON (((teams.id = discovered_route_points.team_id) AND (discovered_route_points.state = 3))))
            GROUP BY teams.id
          )
   SELECT row_number() OVER (ORDER BY classification_entries.discovered_treasures DESC, classification_entries.last_treasure_discovered_at, classification_entries.team_id) AS id,
      classification_entries.team_id,
      classification_entries.discovered_treasures,
      classification_entries.last_treasure_discovered_at
     FROM classification_entries;
  SQL
end
