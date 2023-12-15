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

ActiveRecord::Schema.define(version: 2023_12_10_041014) do

  create_table "parking_blocks", force: :cascade do |t|
    t.integer "block_refno"
    t.string "block_code"
    t.string "block_description"
    t.integer "space_refno"
    t.integer "level_refno"
    t.boolean "isactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_entrances", force: :cascade do |t|
    t.integer "entrance_refno"
    t.string "entrance_description"
    t.boolean "isactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_levels", force: :cascade do |t|
    t.integer "level_refno"
    t.string "level_code"
    t.string "level_description"
    t.boolean "isactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_lot_dtls", force: :cascade do |t|
    t.integer "lot_detail_refno"
    t.integer "lot_hdr_refno"
    t.string "lot_dtl_description"
    t.integer "entrance_refno"
    t.integer "distance"
    t.boolean "isactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_lot_hdrs", force: :cascade do |t|
    t.integer "lot_hdr_refno"
    t.string "lot_hdr_code"
    t.string "lot_hdr_description"
    t.boolean "isactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vehicle_type_refno"
    t.integer "level_refno"
    t.integer "block_refno"
  end

  create_table "parking_lot_statuses", force: :cascade do |t|
    t.integer "lot_status_refno"
    t.string "lot_status_code"
    t.string "lot_status_description"
    t.boolean "isactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_settings", force: :cascade do |t|
    t.integer "setting_refno"
    t.string "setting_code"
    t.string "setting_description"
    t.string "setting_value"
    t.boolean "isactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_spaces", force: :cascade do |t|
    t.integer "space_refno"
    t.string "space_description"
    t.boolean "isactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_transactions", force: :cascade do |t|
    t.integer "transaction_refno"
    t.integer "transaction_vehicle_type"
    t.datetime "transaction_starttime"
    t.datetime "transaction_endtime"
    t.boolean "isactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lot_hdr_refno"
  end

  create_table "parking_vehicle_types", force: :cascade do |t|
    t.integer "vehicle_type_refno"
    t.string "vehicle_type_description"
    t.integer "vehicle_type_amount"
    t.boolean "isactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vehicle_code"
    t.decimal "vehicle_exceed_rate"
  end

  create_table "parking_vehicles", force: :cascade do |t|
    t.integer "vehicle_refno"
    t.string "vehicle_description"
    t.integer "vehicle_typerefno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
