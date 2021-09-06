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

ActiveRecord::Schema.define(version: 2021_09_06_164447) do

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
    t.index ["branch_office_id"], name: "index_colaboradors_on_branch_office_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "description"
    t.string "createBy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
  end

  add_foreign_key "colaboradors", "branch_offices"
end
