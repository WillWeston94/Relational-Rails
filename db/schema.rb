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

ActiveRecord::Schema[7.0].define(version: 2023_08_23_130655) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", id: :bigint, default: -> { "nextval('course_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "faculty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "course_name"
    t.text "professor"
    t.boolean "gen_ed"
    t.integer "credits"
    t.text "start_date"
    t.text "end_date"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.string "email"
    t.string "phone"
    t.boolean "office_hours"
    t.string "years_instructing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "courses", "faculties", name: "courses_faculty_id_fkey"
end
