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

ActiveRecord::Schema.define(version: 2018_06_22_164004) do

  create_table "coordinators", force: :cascade do |t|
    t.string "co_id"
    t.string "name"
    t.string "gender"
    t.date "dob"
    t.date "doj"
    t.string "contact"
    t.string "email"
    t.text "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dol"
  end

  create_table "designations", force: :cascade do |t|
    t.string "name"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_designations", force: :cascade do |t|
    t.boolean "active"
    t.integer "employee_id"
    t.integer "designation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["designation_id"], name: "index_employee_designations_on_designation_id"
    t.index ["employee_id"], name: "index_employee_designations_on_employee_id"
  end

  create_table "employee_workplaces", force: :cascade do |t|
    t.boolean "active"
    t.integer "employee_id"
    t.integer "workplace_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_workplaces_on_employee_id"
    t.index ["workplace_id"], name: "index_employee_workplaces_on_workplace_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "em_id"
    t.string "name"
    t.string "gender"
    t.date "dob"
    t.date "doj"
    t.string "contact"
    t.string "email"
    t.text "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.boolean "active"
    t.string "designation"
    t.integer "location_id"
    t.string "education"
    t.string "compensation"
    t.string "cheque_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dol"
  end

  create_table "member_designations", force: :cascade do |t|
    t.boolean "active"
    t.integer "designation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
    t.index ["designation_id"], name: "index_member_designations_on_designation_id"
    t.index ["member_id"], name: "index_member_designations_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "mem_id"
    t.string "name"
    t.string "gender"
    t.date "dob"
    t.date "doj"
    t.string "contact"
    t.string "email"
    t.text "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.boolean "active"
    t.string "designation"
    t.date "effective_till"
    t.string "type"
    t.boolean "voting_right"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dol"
  end

  create_table "mentors", force: :cascade do |t|
    t.string "men_id"
    t.string "name"
    t.string "gender"
    t.date "dob"
    t.date "doj"
    t.string "contact"
    t.string "email"
    t.text "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dol"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.string "full_form"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "contact_no"
    t.string "contact_person"
    t.text "contact_person_address"
    t.string "contact_person_designation"
    t.string "fees_type"
    t.string "name_on_check"
    t.string "board"
    t.string "initial_class"
    t.string "max_class"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsor_programs", force: :cascade do |t|
    t.boolean "active"
    t.integer "sponsor_id"
    t.integer "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_sponsor_programs_on_program_id"
    t.index ["sponsor_id"], name: "index_sponsor_programs_on_sponsor_id"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "sp_id"
    t.string "name"
    t.string "gender"
    t.date "dob"
    t.date "doj"
    t.string "contact"
    t.string "email"
    t.text "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.boolean "active"
    t.integer "program_id"
    t.string "sponsor_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dol"
  end

  create_table "student_coordinators", force: :cascade do |t|
    t.boolean "active"
    t.integer "student_id"
    t.integer "coordinator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coordinator_id"], name: "index_student_coordinators_on_coordinator_id"
    t.index ["student_id"], name: "index_student_coordinators_on_student_id"
  end

  create_table "student_mentors", force: :cascade do |t|
    t.boolean "active"
    t.integer "student_id"
    t.integer "mentor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentor_id"], name: "index_student_mentors_on_mentor_id"
    t.index ["student_id"], name: "index_student_mentors_on_student_id"
  end

  create_table "student_programs", force: :cascade do |t|
    t.boolean "active"
    t.integer "student_id"
    t.integer "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_student_programs_on_program_id"
    t.index ["student_id"], name: "index_student_programs_on_student_id"
  end

  create_table "student_schools", force: :cascade do |t|
    t.boolean "active"
    t.string "time_period"
    t.string "academic_period"
    t.text "fees"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.integer "school_id"
    t.index ["school_id"], name: "index_student_schools_on_school_id"
    t.index ["student_id"], name: "index_student_schools_on_student_id"
  end

  create_table "student_sponsors", force: :cascade do |t|
    t.string "academic_year"
    t.string "sponsor_type"
    t.boolean "active"
    t.integer "student_id"
    t.integer "sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sponsor_id"], name: "index_student_sponsors_on_sponsor_id"
    t.index ["student_id"], name: "index_student_sponsors_on_student_id"
  end

  create_table "student_supports", force: :cascade do |t|
    t.boolean "active"
    t.integer "student_id"
    t.integer "support_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_supports_on_student_id"
    t.index ["support_id"], name: "index_student_supports_on_support_id"
  end

  create_table "student_volunteers", force: :cascade do |t|
    t.boolean "active"
    t.integer "student_id"
    t.integer "volunteer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_volunteers_on_student_id"
    t.index ["volunteer_id"], name: "index_student_volunteers_on_volunteer_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "st_id"
    t.string "name"
    t.string "gender"
    t.date "dob"
    t.date "doj"
    t.string "contact_1"
    t.string "contact_2"
    t.string "contact_3"
    t.string "email"
    t.text "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.boolean "active"
    t.string "fathers_name"
    t.string "fathers_occupation"
    t.string "mothers_name"
    t.string "mothers_occupation"
    t.string "village_id"
    t.string "society"
    t.integer "school_id"
    t.integer "program_id"
    t.integer "support_id"
    t.integer "mentor_id"
    t.integer "sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.date "dol"
    t.integer "coordinator_id"
    t.string "grade"
    t.index ["coordinator_id"], name: "index_students_on_coordinator_id"
  end

  create_table "supports", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "contact"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "volunteer_schools", force: :cascade do |t|
    t.boolean "active"
    t.integer "school_id"
    t.integer "volunteer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_volunteer_schools_on_school_id"
    t.index ["volunteer_id"], name: "index_volunteer_schools_on_volunteer_id"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "vol_id"
    t.string "name"
    t.string "gender"
    t.date "dob"
    t.date "doj"
    t.string "contact"
    t.string "email"
    t.text "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.boolean "active"
    t.string "occupation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dol"
    t.string "days_available"
  end

  create_table "workplaces", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "contact"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
