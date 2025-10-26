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

ActiveRecord::Schema[8.0].define(version: 2025_10_25_224609) do
  create_table "appointments", force: :cascade do |t|
    t.string "category"
    t.datetime "appt_start"
    t.datetime "appt_end"
    t.string "title"
    t.string "notes"
    t.integer "pet_profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_profile_id"], name: "index_appointments_on_pet_profile_id"
  end

  create_table "pet_profiles", force: :cascade do |t|
    t.string "animal"
    t.string "name"
    t.date "dob"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplies", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.integer "inventory_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pet_profile_id"
    t.string "supply_type"
    t.index ["pet_profile_id"], name: "index_supplies_on_pet_profile_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.date "due_date"
    t.boolean "complete"
    t.string "notes"
    t.boolean "recurring"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pet_profile_id", null: false
    t.index ["pet_profile_id"], name: "index_tasks_on_pet_profile_id"
  end

  add_foreign_key "appointments", "pet_profiles"
  add_foreign_key "supplies", "pet_profiles"
  add_foreign_key "tasks", "pet_profiles"
end
