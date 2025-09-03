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

ActiveRecord::Schema[8.0].define(version: 2025_09_03_160359) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "favorite_heroes", force: :cascade do |t|
    t.bigint "play_model_id", null: false
    t.bigint "hero_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_favorite_heroes_on_hero_id"
    t.index ["play_model_id"], name: "index_favorite_heroes_on_play_model_id"
  end

  create_table "heroes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.string "icon_url"
  end

  create_table "partner_condition_heros", force: :cascade do |t|
    t.bigint "partner_condition_id", null: false
    t.bigint "hero_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_partner_condition_heros_on_hero_id"
    t.index ["partner_condition_id"], name: "index_partner_condition_heros_on_partner_condition_id"
  end

  create_table "partner_conditions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "age_preference"
    t.bigint "play_time_id", null: false
    t.bigint "play_style_id", null: false
    t.bigint "talk_style_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rank_id", null: false
    t.integer "target_role"
    t.index ["play_style_id"], name: "index_partner_conditions_on_play_style_id"
    t.index ["play_time_id"], name: "index_partner_conditions_on_play_time_id"
    t.index ["rank_id"], name: "index_partner_conditions_on_rank_id"
    t.index ["talk_style_id"], name: "index_partner_conditions_on_talk_style_id"
    t.index ["user_id"], name: "index_partner_conditions_on_user_id"
  end

  create_table "play_model_ranks", force: :cascade do |t|
    t.bigint "play_model_id", null: false
    t.bigint "rank_id", null: false
    t.integer "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["play_model_id"], name: "index_play_model_ranks_on_play_model_id"
    t.index ["rank_id"], name: "index_play_model_ranks_on_rank_id"
  end

  create_table "play_models", force: :cascade do |t|
    t.bigint "play_time_id", null: false
    t.bigint "play_style_id", null: false
    t.bigint "talk_style_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tank_rank_id"
    t.integer "damage_rank_id"
    t.integer "support_rank_id"
    t.bigint "user_id", null: false
    t.index ["play_style_id"], name: "index_play_models_on_play_style_id"
    t.index ["play_time_id"], name: "index_play_models_on_play_time_id"
    t.index ["talk_style_id"], name: "index_play_models_on_talk_style_id"
    t.index ["user_id"], name: "index_play_models_on_user_id"
  end

  create_table "play_styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "style"
  end

  create_table "play_times", force: :cascade do |t|
    t.integer "time_slot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tier"
  end

  create_table "role_criterions", force: :cascade do |t|
    t.bigint "partner_condition_id", null: false
    t.integer "role"
    t.bigint "rank_id", null: false
    t.integer "condition_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_condition_id"], name: "index_role_criterions_on_partner_condition_id"
    t.index ["rank_id"], name: "index_role_criterions_on_rank_id"
  end

  create_table "talk_styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vc"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "age"
    t.integer "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "encrypted_password", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorite_heroes", "heroes"
  add_foreign_key "favorite_heroes", "play_models"
  add_foreign_key "partner_condition_heros", "heroes"
  add_foreign_key "partner_condition_heros", "partner_conditions"
  add_foreign_key "partner_conditions", "play_styles"
  add_foreign_key "partner_conditions", "play_times"
  add_foreign_key "partner_conditions", "ranks"
  add_foreign_key "partner_conditions", "talk_styles"
  add_foreign_key "partner_conditions", "users"
  add_foreign_key "play_model_ranks", "play_models"
  add_foreign_key "play_model_ranks", "ranks"
  add_foreign_key "play_models", "play_styles"
  add_foreign_key "play_models", "play_times"
  add_foreign_key "play_models", "talk_styles"
  add_foreign_key "play_models", "users"
  add_foreign_key "role_criterions", "partner_conditions"
  add_foreign_key "role_criterions", "ranks"
end
