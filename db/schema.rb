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

ActiveRecord::Schema[7.1].define(version: 2024_01_29_135115) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "krapin"
    t.string "idno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insurance_companies", force: :cascade do |t|
    t.string "company"
    t.decimal "rate"
    t.decimal "excessprotector"
    t.decimal "pvt"
    t.decimal "lossofuse"
    t.decimal "pcf"
    t.decimal "itl"
    t.decimal "stampduty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.string "policyno"
    t.string "reg"
    t.decimal "premium"
    t.date "start"
    t.date "expire"
    t.string "classification"
    t.bigint "insurance_companies_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_transactions_on_client_id"
    t.index ["insurance_companies_id"], name: "index_transactions_on_insurance_companies_id"
  end

  add_foreign_key "transactions", "clients"
  add_foreign_key "transactions", "insurance_companies", column: "insurance_companies_id"
end
