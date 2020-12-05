# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_05_015859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "problem_id", null: false
    t.string "description"
    t.boolean "correct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "selected", default: false
    t.datetime "answered_at"
    t.integer "order"
    t.index ["problem_id"], name: "index_answers_on_problem_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.integer "status"
    t.bigint "category_id"
    t.string "difficulty"
    t.datetime "finished_at"
    t.index ["category_id"], name: "index_games_on_category_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "problems", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "difficulty"
    t.string "question"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "game_id", null: false
    t.integer "score", default: 0
    t.index ["category_id"], name: "index_problems_on_category_id"
    t.index ["game_id"], name: "index_problems_on_game_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "api_token"
    t.datetime "last_used_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "game_id", null: false
    t.index ["game_id"], name: "index_tokens_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "problems"
  add_foreign_key "games", "categories"
  add_foreign_key "games", "users"
  add_foreign_key "problems", "categories"
  add_foreign_key "problems", "games"
  add_foreign_key "tokens", "games"
end
