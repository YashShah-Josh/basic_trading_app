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

ActiveRecord::Schema[7.2].define(version: 2025_01_30_101936) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "market_trends", force: :cascade do |t|
    t.integer "stock_id", null: false
    t.decimal "opening_price"
    t.decimal "closing_price"
    t.integer "volume"
    t.date "trend_date"
    t.string "trend_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_market_trends_on_stock_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.decimal "target"
    t.decimal "achieved"
    t.decimal "commission"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.string "name"
    t.decimal "current_price"
    t.decimal "previous_close"
    t.decimal "day_high"
    t.decimal "day_low"
    t.decimal "change_percentage"
    t.datetime "last_updated"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "stock_id", null: false
    t.integer "quantity"
    t.decimal "price"
    t.string "trade_type"
    t.string "status"
    t.datetime "transaction_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_trades_on_stock_id"
    t.index ["user_id"], name: "index_trades_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "account_status"
    t.string "kyc_status"
    t.decimal "account_balance"
    t.datetime "registration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "market_trends", "stocks"
  add_foreign_key "trades", "stocks"
  add_foreign_key "trades", "users"
end
