# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_13_234115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.boolean "correct_answer"
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "answer"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "atributions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_atributions_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.integer "duration"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "price"
    t.string "abbreviation"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "elements", force: :cascade do |t|
    t.string "element_type"
    t.bigint "section_id", null: false
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "video"
    t.index ["section_id"], name: "index_elements_on_section_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "description"
    t.bigint "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "icon"
    t.index ["course_id"], name: "index_features_on_course_id"
  end

  create_table "lesson_dones", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.bigint "user_id", null: false
    t.boolean "done"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_lesson_dones_on_lesson_id"
    t.index ["user_id"], name: "index_lesson_dones_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.bigint "modul_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["modul_id"], name: "index_lessons_on_modul_id"
  end

  create_table "moduls", force: :cascade do |t|
    t.string "title"
    t.string "download_document"
    t.string "description"
    t.bigint "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
    t.index ["course_id"], name: "index_moduls_on_course_id"
  end

  create_table "paid_courses", force: :cascade do |t|
    t.boolean "paid"
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_paid_courses_on_course_id"
    t.index ["user_id"], name: "index_paid_courses_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "state"
    t.datetime "year"
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_questions_on_lesson_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.float "score", default: 0.0
    t.integer "selected_answer_ids", array: true
    t.boolean "is_submitted", default: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "quizzes_questions", force: :cascade do |t|
    t.bigint "quiz_id"
    t.bigint "question_id"
    t.index ["question_id"], name: "index_quizzes_questions_on_question_id"
    t.index ["quiz_id"], name: "index_quizzes_questions_on_quiz_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_requirements_on_course_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "favorite_class"
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "text"
    t.index ["lesson_id"], name: "index_sections_on_lesson_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "description"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_teachers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "description"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_lessons", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "lesson_id"
    t.boolean "is_completed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_users_lessons_on_lesson_id"
    t.index ["user_id"], name: "index_users_lessons_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "questions"
  add_foreign_key "atributions", "courses"
  add_foreign_key "courses", "teachers"
  add_foreign_key "elements", "sections"
  add_foreign_key "lesson_dones", "lessons"
  add_foreign_key "lesson_dones", "users"
  add_foreign_key "lessons", "moduls"
  add_foreign_key "paid_courses", "courses"
  add_foreign_key "paid_courses", "users"
  add_foreign_key "questions", "lessons"
  add_foreign_key "requirements", "courses"
  add_foreign_key "sections", "lessons"
end
