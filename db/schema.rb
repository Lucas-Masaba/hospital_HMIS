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

ActiveRecord::Schema[7.0].define(version: 2023_01_18_153510) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "prescriptions", force: :cascade do |t|
    t.string "product"
    t.integer "quantity"
    t.integer "dose"
    t.string "symbol"
    t.integer "days"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "visit_id", null: false
    t.index ["visit_id"], name: "index_prescriptions_on_visit_id"
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
  end

  add_foreign_key "prescriptions", "visits"
end
