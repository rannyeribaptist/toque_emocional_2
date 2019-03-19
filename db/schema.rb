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

ActiveRecord::Schema.define(version: 2019_03_14_185808) do

  create_table "appointment_students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "appointment_id"
    t.bigint "student_id"
    t.string "name"
    t.string "classy"
    t.string "groupy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.timestamp "deleted_at"
    t.index ["appointment_id"], name: "index_appointment_students_on_appointment_id"
    t.index ["student_id"], name: "index_appointment_students_on_student_id"
  end

  create_table "appointments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "school_id"
    t.bigint "student_id"
    t.date "appointment_date"
    t.string "appointment_time"
    t.text "description"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.timestamp "deleted_at"
    t.index ["school_id"], name: "index_appointments_on_school_id"
    t.index ["student_id"], name: "index_appointments_on_student_id"
  end

  create_table "book_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "guest_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_comments_on_book_id"
    t.index ["guest_id"], name: "index_book_comments_on_guest_id"
  end

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "file"
    t.string "name"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_complements_on_book_id"
  end

  create_table "guests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "classy"
    t.string "groupy"
    t.string "school_id"
    t.string "code"
    t.boolean "authenticated"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_guests_on_book_id"
  end

  create_table "occurrencies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "description"
    t.string "filled_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id"
    t.timestamp "deleted_at"
    t.string "emotional_sphere"
    t.index ["school_id"], name: "index_occurrencies_on_school_id"
  end

  create_table "occurrency_students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "occurrency_id"
    t.bigint "student_id"
    t.string "name"
    t.string "classy"
    t.string "groupy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.timestamp "deleted_at"
    t.index ["occurrency_id"], name: "index_occurrency_students_on_occurrency_id"
    t.index ["student_id"], name: "index_occurrency_students_on_student_id"
  end

  create_table "phrases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.timestamp "deleted_at"
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "school_id"
    t.string "classy"
    t.string "groupy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.timestamp "deleted_at"
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "school_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.timestamp "deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  add_foreign_key "appointment_students", "appointments"
  add_foreign_key "appointment_students", "students"
  add_foreign_key "appointments", "schools"
  add_foreign_key "appointments", "students"
  add_foreign_key "book_comments", "books"
  add_foreign_key "book_comments", "guests"
  add_foreign_key "complements", "books"
  add_foreign_key "guests", "books"
  add_foreign_key "occurrencies", "schools"
  add_foreign_key "occurrency_students", "occurrencies"
  add_foreign_key "occurrency_students", "students"
  add_foreign_key "students", "schools"
  add_foreign_key "users", "schools"
end
