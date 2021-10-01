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

ActiveRecord::Schema.define(version: 2021_10_01_000607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointment_details", force: :cascade do |t|
    t.bigint "appointment_id", null: false
    t.bigint "vaccine_id", null: false
    t.string "status"
    t.string "createdBy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nurseName", default: "none"
    t.index ["appointment_id"], name: "index_appointment_details_on_appointment_id"
    t.index ["vaccine_id"], name: "index_appointment_details_on_vaccine_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "branch_office_id", null: false
    t.bigint "patient_id", null: false
    t.bigint "tutor_id", null: false
    t.string "status"
    t.string "createdBy"
    t.datetime "cancelAt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "appointmentDate"
    t.index ["branch_office_id"], name: "index_appointments_on_branch_office_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["tutor_id"], name: "index_appointments_on_tutor_id"
  end

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
    t.bigint "user_id", default: 7, null: false
    t.index ["branch_office_id"], name: "index_colaboradors_on_branch_office_id"
    t.index ["role_id"], name: "index_colaboradors_on_role_id"
    t.index ["user_id"], name: "index_colaboradors_on_user_id"
  end

  create_table "dependents", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "tutor_id", null: false
    t.bigint "relationship_id", null: false
    t.string "createdBy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_dependents_on_patient_id"
    t.index ["relationship_id"], name: "index_dependents_on_relationship_id"
    t.index ["tutor_id"], name: "index_dependents_on_tutor_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "gender"
    t.date "birthday"
    t.string "createdBy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "identityCard"
  end

  create_table "relationships", force: :cascade do |t|
    t.string "name"
    t.string "createdBy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.bigint "user_id", default: 7, null: false
    t.index ["user_id"], name: "index_tutors_on_user_id"
  end

  create_table "user_tutors", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "tutor_id", null: false
    t.string "identityCard"
    t.string "email"
    t.string "password_digest"
    t.string "createdBy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_tutors_on_role_id"
    t.index ["tutor_id"], name: "index_user_tutors_on_tutor_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.string "username"
    t.string "password_digest"
    t.string "createBy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
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

  add_foreign_key "appointment_details", "appointments"
  add_foreign_key "appointment_details", "vaccines"
  add_foreign_key "appointments", "branch_offices"
  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "tutors"
  add_foreign_key "colaboradors", "branch_offices"
  add_foreign_key "colaboradors", "roles"
  add_foreign_key "colaboradors", "users"
  add_foreign_key "dependents", "patients"
  add_foreign_key "dependents", "relationships"
  add_foreign_key "dependents", "tutors"
  add_foreign_key "tutors", "users"
  add_foreign_key "user_tutors", "roles"
  add_foreign_key "user_tutors", "tutors"
  add_foreign_key "users", "roles"
end
