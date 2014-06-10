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

ActiveRecord::Schema.define(version: 20140610153458) do

  create_table "anasthetic_types", force: true do |t|
    t.string   "anasthetic_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "surgery_id"
  end

  create_table "anasthetics_useds", force: true do |t|
    t.integer  "surgery_id"
    t.integer  "anasthetic_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "anasthetics_useds", ["anasthetic_type_id"], name: "index_anasthetics_useds_on_anasthetic_type_id"
  add_index "anasthetics_useds", ["surgery_id"], name: "index_anasthetics_useds_on_surgery_id"

  create_table "chemicals", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chemicals_useds", force: true do |t|
    t.integer  "surgery_id"
    t.integer  "chemical_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chemicals_useds", ["chemical_id"], name: "index_chemicals_useds_on_chemical_id"
  add_index "chemicals_useds", ["surgery_id"], name: "index_chemicals_useds_on_surgery_id"

  create_table "dimensions", force: true do |t|
    t.string   "dimension_type"
    t.integer  "implant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dimensions", ["implant_id"], name: "index_dimensions_on_implant_id"

  create_table "hospital_admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "hospital_id"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hospital_admins", ["email"], name: "index_hospital_admins_on_email", unique: true
  add_index "hospital_admins", ["reset_password_token"], name: "index_hospital_admins_on_reset_password_token", unique: true

  create_table "hospitals", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "implant_indication_surgeries", force: true do |t|
    t.integer  "surgery_id"
    t.integer  "implant_indication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "implant_indication_surgeries", ["implant_indication_id"], name: "index_implant_indication_surgeries_on_implant_indication_id"
  add_index "implant_indication_surgeries", ["surgery_id"], name: "index_implant_indication_surgeries_on_surgery_id"

  create_table "implant_indications", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "surgery_id"
  end

  create_table "implant_sizes", force: true do |t|
    t.integer  "dimension_id"
    t.float    "measurement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "implant_sizes", ["dimension_id"], name: "index_implant_sizes_on_dimension_id"

  create_table "implants", force: true do |t|
    t.string   "name"
    t.string   "implant_type"
    t.integer  "manufacturer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "implants", ["manufacturer_id"], name: "index_implants_on_manufacturer_id"

  create_table "implants_useds", force: true do |t|
    t.integer  "surgery_id"
    t.integer  "manufacturer_id"
    t.integer  "implant_id"
    t.integer  "dimension_id"
    t.integer  "implant_size_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "implants_useds", ["dimension_id"], name: "index_implants_useds_on_dimension_id"
  add_index "implants_useds", ["implant_id"], name: "index_implants_useds_on_implant_id"
  add_index "implants_useds", ["implant_size_id"], name: "index_implants_useds_on_implant_size_id"
  add_index "implants_useds", ["manufacturer_id"], name: "index_implants_useds_on_manufacturer_id"
  add_index "implants_useds", ["surgery_id"], name: "index_implants_useds_on_surgery_id"

  create_table "manufacturers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mechanicals", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "surgery_id"
  end

  create_table "mechanicals_useds", force: true do |t|
    t.integer  "surgery_id"
    t.integer  "mechanical_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mechanicals_useds", ["mechanical_id"], name: "index_mechanicals_useds_on_mechanical_id"
  add_index "mechanicals_useds", ["surgery_id"], name: "index_mechanicals_useds_on_surgery_id"

  create_table "patient_procedures", force: true do |t|
    t.string   "name"
    t.string   "procedure_type"
    t.integer  "surgery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patient_procedures", ["surgery_id"], name: "index_patient_procedures_on_surgery_id"

  create_table "patients", force: true do |t|
    t.string   "medical_record_number"
    t.string   "name"
    t.date     "date_of_birth"
    t.string   "gender"
    t.integer  "weight"
    t.integer  "height"
    t.string   "race"
    t.string   "postcode"
    t.string   "id_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "procedures_useds", force: true do |t|
    t.integer  "surgery_id"
    t.integer  "patient_procedure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "procedures_useds", ["patient_procedure_id"], name: "index_procedures_useds_on_patient_procedure_id"
  add_index "procedures_useds", ["surgery_id"], name: "index_procedures_useds_on_surgery_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "super_admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "super_admins", ["email"], name: "index_super_admins_on_email", unique: true
  add_index "super_admins", ["reset_password_token"], name: "index_super_admins_on_reset_password_token", unique: true

  create_table "surgeons", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tjr_code"
    t.string   "registration_code"
  end

  add_index "surgeons", ["email"], name: "index_surgeons_on_email", unique: true
  add_index "surgeons", ["reset_password_token"], name: "index_surgeons_on_reset_password_token", unique: true

  create_table "surgeries", force: true do |t|
    t.integer  "patient_id"
    t.integer  "surgeon_id"
    t.date     "date_of_surgery"
    t.string   "side"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "surgery_type"
    t.string   "patient_position"
    t.string   "total_hip_approach"
    t.integer  "hospital_id"
    t.integer  "user_id"
  end

  add_index "surgeries", ["hospital_id"], name: "index_surgeries_on_hospital_id"
  add_index "surgeries", ["patient_id"], name: "index_surgeries_on_patient_id"
  add_index "surgeries", ["surgeon_id"], name: "index_surgeries_on_surgeon_id"
  add_index "surgeries", ["user_id"], name: "index_surgeries_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "registration_code"
    t.string   "name"
    t.string   "user_type"
    t.string   "phone_number"
    t.boolean  "approved"
    t.integer  "hospital_id"
    t.string   "njr_code"
    t.string   "title"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["hospital_id"], name: "index_users_on_hospital_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
