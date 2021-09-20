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

ActiveRecord::Schema.define(version: 2021_09_20_001219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branch_offices", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "sector"
    t.string "province"
    t.string "state"
    t.string "createBy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
  end

  create_table "colaboradors", force: :cascade do |t|
    t.string "names"
    t.string "surname"
    t.string "status"
    t.string "email"
    t.text "address"
    t.bigint "branch_office_id", null: false
    t.string "createBy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "role_id"
    t.index ["branch_office_id"], name: "index_colaboradors_on_branch_office_id"
    t.index ["role_id"], name: "index_colaboradors_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "description"
    t.string "createBy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tutors", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "documentType"
    t.string "identityCard"
    t.string "email"
    t.string "gender"
    t.date "birthday"
    t.string "phone"
    t.string "telephone"
    t.string "workTelephone"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "createdBy"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "colaborador_id", null: false
    t.string "username"
    t.string "password_digest"
    t.string "createBy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.index ["colaborador_id"], name: "index_users_on_colaborador_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "vaccines", force: :cascade do |t|
    t.string "description"
    t.string "status"
    t.string "dose"
    t.string "typeDose"
    t.string "createBy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "edadMinima"
    t.integer "edadMaxima"
    t.string "name"
  end

  add_foreign_key "colaboradors", "branch_offices"
  add_foreign_key "colaboradors", "roles"
  add_foreign_key "users", "colaboradors"
  add_foreign_key "users", "roles"
end
