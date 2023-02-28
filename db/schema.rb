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

ActiveRecord::Schema[7.0].define(version: 2023_02_28_231713) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "admissions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drugs", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.string "location"
    t.bigint "drug_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "visit_id", null: false
    t.index ["visit_id"], name: "index_drugs_on_visit_id"
  end

  create_table "lab_results", force: :cascade do |t|
    t.string "results"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lab_tests", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "status"
    t.string "referral_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "normal_ranges", force: :cascade do |t|
    t.string "name"
    t.float "lower_range"
    t.float "upper_range"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.text "name"
    t.integer "age"
    t.bigint "gender"
    t.date "date_of_birth"
    t.string "address"
    t.bigint "phone_number"
    t.string "next_of_kin"
    t.bigint "next_of_kin_phone"
    t.string "next_of_kin_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pharmacies", force: :cascade do |t|
    t.integer "dispensed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "product"
    t.integer "quantity"
    t.string "symbol"
    t.integer "dose"
    t.integer "days"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "visit_id", null: false
    t.index ["visit_id"], name: "index_prescriptions_on_visit_id"
  end

  create_table "radiology_exams", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "radiology_results", force: :cascade do |t|
    t.string "image"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "speciality"
    t.string "contact"
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["jti"], name: "index_staffs_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "triages", force: :cascade do |t|
    t.text "name"
    t.string "value_one"
    t.string "value_two"
    t.datetime "date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "visit_id", null: false
    t.index ["visit_id"], name: "index_triages_on_visit_id"
  end

  create_table "visit_notes", force: :cascade do |t|
    t.text "complaints"
    t.string "provisional_diagnosis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visits", force: :cascade do |t|
    t.integer "visit_no"
    t.string "visit_owner"
    t.date "visit_date"
    t.text "visit_type"
    t.text "visit_category"
    t.string "speciality"
    t.string "member_no"
    t.string "service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id", null: false
    t.index ["patient_id"], name: "index_visits_on_patient_id"
  end

  add_foreign_key "drugs", "visits"
  add_foreign_key "prescriptions", "visits"
  add_foreign_key "triages", "visits"
  add_foreign_key "visits", "patients"
end
