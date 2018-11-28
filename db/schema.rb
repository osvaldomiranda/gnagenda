# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20181128001242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: true do |t|
    t.integer  "duration"
    t.string   "zone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "centers", force: true do |t|
    t.integer  "id_centro"
    t.integer  "id_propietario"
    t.text     "nombre_centro"
    t.string   "dir_centro"
    t.string   "sector_centro"
    t.string   "comuna_centro"
    t.string   "rut_centro"
    t.string   "web"
    t.string   "email"
    t.string   "telefonos"
    t.string   "anexo"
    t.string   "plan"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "rut"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "celphone"
    t.integer  "age"
    t.string   "gender"
    t.string   "citizenship"
    t.string   "origin"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "durations", force: true do |t|
    t.string   "name"
    t.integer  "duration"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "durations", ["service_id"], name: "index_durations_on_service_id", using: :btree

  create_table "kinesiologists", force: true do |t|
    t.integer  "id_centro"
    t.string   "nombre"
    t.float    "hh_mensuales"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "look_times", force: true do |t|
    t.integer  "hour"
    t.integer  "day"
    t.date     "from"
    t.date     "to"
    t.integer  "center_id"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "look_times", ["center_id"], name: "index_look_times_on_center_id", using: :btree
  add_index "look_times", ["resource_id"], name: "index_look_times_on_resource_id", using: :btree

  create_table "notes", force: true do |t|
    t.string   "body"
    t.integer  "schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["schedule_id"], name: "index_notes_on_schedule_id", using: :btree

  create_table "notification_schedules", force: true do |t|
    t.string   "receiver"
    t.string   "means"
    t.integer  "notification_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "schedule_id"
  end

  add_index "notification_schedules", ["notification_id"], name: "index_notification_schedules_on_notification_id", using: :btree
  add_index "notification_schedules", ["schedule_id"], name: "index_notification_schedules_on_schedule_id", using: :btree

  create_table "notifications", force: true do |t|
    t.string   "body"
    t.string   "body_textmsg"
    t.string   "event"
    t.integer  "delay"
    t.integer  "previous"
    t.integer  "center_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["center_id"], name: "index_notifications_on_center_id", using: :btree

  create_table "resources", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "center_id"
    t.integer  "service_id"
  end

  add_index "resources", ["center_id"], name: "index_resources_on_center_id", using: :btree
  add_index "resources", ["service_id"], name: "index_resources_on_service_id", using: :btree

  create_table "schedules", force: true do |t|
    t.integer  "id_centro"
    t.string   "rol"
    t.integer  "reservation_id"
    t.string   "status"
    t.datetime "creation_time"
    t.integer  "quantity"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "user_notes"
    t.string   "custom_color"
    t.string   "night_reservation"
    t.string   "currency"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "login"
    t.string   "user_id"
    t.string   "email"
    t.string   "mobile_number"
    t.string   "mobile_country_code"
    t.string   "phone"
    t.string   "phone_country_code"
    t.string   "zip"
    t.string   "country"
    t.string   "address"
    t.string   "state"
    t.string   "city"
    t.string   "resource_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nameresource"
    t.date     "fecha"
    t.string   "hora"
    t.string   "duration"
    t.string   "reminder"
    t.string   "age"
    t.string   "gender"
    t.string   "nationality"
    t.string   "origin"
    t.string   "rut"
    t.integer  "service_id"
    t.integer  "duration_id"
  end

  add_index "schedules", ["duration_id"], name: "index_schedules_on_duration_id", using: :btree
  add_index "schedules", ["service_id"], name: "index_schedules_on_service_id", using: :btree

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "rut"
    t.string   "name"
    t.string   "access_token"
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
