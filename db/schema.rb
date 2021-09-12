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

ActiveRecord::Schema.define(version: 2021_09_11_161858) do

  create_table "battings", force: :cascade do |t|
    t.string "player_id"
    t.string "team_id"
    t.integer "year_id"
    t.integer "stint"
    t.integer "ab"
    t.integer "h"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer "year_id"
    t.string "lg_id"
    t.string "team_id"
    t.string "franch_id"
    t.string "div_id"
    t.integer "rank"
    t.integer "ghome"
    t.boolean "div_win"
    t.boolean "wc_win"
    t.boolean "lg_win"
    t.boolean "ws_win"
    t.string "name"
    t.string "park"
    t.integer "attendance"
    t.integer "bpf"
    t.integer "ppf"
    t.string "team_id_br"
    t.string "team_id_lahman45"
    t.string "team_id_retro"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
