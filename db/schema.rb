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

ActiveRecord::Schema[7.0].define(version: 2023_03_27_222152) do
  create_table "assignments", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "course_id", null: false
    t.index ["course_id"], name: "index_assignments_on_course_id"
    t.index ["teacher_id"], name: "index_assignments_on_teacher_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "slug"
    t.string "name"
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "zip"
  end

  create_table "courses", force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.text "description"
    t.integer "quarter_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_courses_on_category_id"
    t.index ["quarter_id"], name: "index_courses_on_quarter_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.decimal "grade"
    t.integer "exam_id", null: false
    t.integer "student_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "created_at"
    t.datetime "modified_at"
    t.index ["exam_id"], name: "index_evaluations_on_exam_id"
    t.index ["student_id"], name: "index_evaluations_on_student_id"
    t.index ["teacher_id"], name: "index_evaluations_on_teacher_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.decimal "weight"
    t.datetime "passed_at"
    t.integer "teacher_id", null: false
    t.index ["teacher_id"], name: "index_exams_on_teacher_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "type", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "address"
    t.integer "city_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["city_id"], name: "index_people_on_city_id"
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true
  end

  create_table "person_roles", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "role_id", null: false
    t.datetime "attributed_at"
    t.datetime "modified_at"
    t.index ["person_id"], name: "index_person_roles_on_person_id"
    t.index ["role_id"], name: "index_person_roles_on_role_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.datetime "started_at"
    t.datetime "ended_at"
  end

  create_table "quarters", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer "semester_id", null: false
    t.index ["semester_id"], name: "index_quarters_on_semester_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "slug"
    t.string "name"
  end

  create_table "semesters", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
  end

  create_table "student_promotions", force: :cascade do |t|
    t.integer "promotion_id", null: false
    t.integer "student_id", null: false
    t.datetime "started_at"
    t.datetime "ended_at"
    t.index ["promotion_id"], name: "index_student_promotions_on_promotion_id"
    t.index ["student_id"], name: "index_student_promotions_on_student_id"
  end

  create_table "student_semesters", force: :cascade do |t|
    t.boolean "conditional"
    t.integer "student_id", null: false
    t.integer "semester_id", null: false
    t.index ["semester_id"], name: "index_student_semesters_on_semester_id"
    t.index ["student_id"], name: "index_student_semesters_on_student_id"
  end

  add_foreign_key "assignments", "courses"
  add_foreign_key "assignments", "people", column: "teacher_id"
  add_foreign_key "categories", "categories"
  add_foreign_key "courses", "categories"
  add_foreign_key "courses", "quarters"
  add_foreign_key "evaluations", "exams"
  add_foreign_key "evaluations", "people", column: "student_id"
  add_foreign_key "evaluations", "people", column: "teacher_id"
  add_foreign_key "exams", "people", column: "teacher_id"
  add_foreign_key "people", "cities"
  add_foreign_key "person_roles", "people"
  add_foreign_key "person_roles", "roles"
  add_foreign_key "quarters", "semesters"
  add_foreign_key "student_promotions", "people", column: "student_id"
  add_foreign_key "student_promotions", "promotions"
  add_foreign_key "student_semesters", "people", column: "student_id"
  add_foreign_key "student_semesters", "semesters"
end
