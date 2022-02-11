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

ActiveRecord::Schema[6.1].define(version: 2020_05_11_040540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id", unique: true
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "word_count_files", force: :cascade do |t|
    t.integer "actual_word_count", null: false
    t.decimal "work_type_multiplicand", null: false
    t.decimal "total", null: false
    t.text "notes"
    t.bigint "word_count_id", null: false
    t.bigint "work_file_id", null: false
    t.bigint "work_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["word_count_id"], name: "index_word_count_files_on_word_count_id"
    t.index ["work_file_id", "work_type_id", "word_count_id"], name: "index_word_count_files_on_work_file_&_work_type_&_word_count", unique: true
    t.index ["work_file_id"], name: "index_word_count_files_on_work_file_id"
    t.index ["work_type_id"], name: "index_word_count_files_on_work_type_id"
  end

  create_table "word_counts", force: :cascade do |t|
    t.date "date", null: false
    t.text "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["date", "user_id"], name: "index_word_counts_on_date_and_user_id", unique: true
    t.index ["user_id"], name: "index_word_counts_on_user_id"
  end

  create_table "work_files", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_work_files_on_name", unique: true
  end

  create_table "work_types", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "multiplicand", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_work_types_on_name", unique: true
  end

  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "word_count_files", "word_counts"
  add_foreign_key "word_count_files", "work_files"
  add_foreign_key "word_count_files", "work_types"
  add_foreign_key "word_counts", "users"
end
