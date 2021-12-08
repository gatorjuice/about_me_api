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

ActiveRecord::Schema.define(version: 2021_11_28_011442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "img_url"
    t.integer "page_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "concerts", force: :cascade do |t|
    t.string "source_id"
    t.string "band"
    t.datetime "date_time"
    t.jsonb "dates"
    t.jsonb "sales"
    t.jsonb "price_ranges"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "venues"
    t.index ["band", "source_id"], name: "index_concerts_on_band_and_source_id", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "category"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "funny_bot_messages", force: :cascade do |t|
    t.integer "user_id"
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "created_by_funny_bot", default: false
  end

  create_table "github_repos", force: :cascade do |t|
    t.string "organization"
    t.string "project"
    t.integer "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization", "project"], name: "index_github_repos_on_organization_and_project", unique: true
  end

  create_table "movies", force: :cascade do |t|
    t.string "box_office_mojo_id"
    t.string "title"
    t.text "summary"
    t.jsonb "performance"
    t.jsonb "crew"
    t.jsonb "cast"
    t.jsonb "misc"
    t.text "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["box_office_mojo_id"], name: "index_movies_on_box_office_mojo_id", unique: true
  end

  create_table "todos", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.text "details"
    t.datetime "due_at"
    t.datetime "completed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["completed_at"], name: "index_todos_on_completed_at"
    t.index ["due_at"], name: "index_todos_on_due_at"
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "user_books", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
