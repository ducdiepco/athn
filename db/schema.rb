# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_18_195118) do

  create_table "diagnoses", force: :cascade do |t|
    t.string "diagnosis"
    t.string "diagnosis_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications", force: :cascade do |t|
    t.string "medication_name"
    t.string "manufacturer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_diagnoses", force: :cascade do |t|
    t.integer "diagnosis_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "diagnosing_provider_id"
    t.integer "patient_id"
    t.index ["diagnosing_provider_id"], name: "index_patient_diagnoses_on_diagnosing_provider_id"
    t.index ["diagnosis_id"], name: "index_patient_diagnoses_on_diagnosis_id"
    t.index ["patient_id"], name: "index_patient_diagnoses_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "office_address"
    t.string "office_city"
    t.string "office_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.integer "medication_id"
    t.string "dosage"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "patient_id"
    t.index ["medication_id"], name: "index_treatments_on_medication_id"
    t.index ["patient_id"], name: "index_treatments_on_patient_id"
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "visit_date"
    t.text "notes"
    t.integer "provider_id"
    t.integer "patient_id"
    t.index ["patient_id"], name: "index_visits_on_patient_id"
    t.index ["provider_id"], name: "index_visits_on_provider_id"
  end

end
