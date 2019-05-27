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

ActiveRecord::Schema.define(version: 20190522073016) do

  create_table "blands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "bland_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buyers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",       null: false
    t.integer  "shipping_cost"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_buyers_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category_large"
    t.string   "category_medium"
    t.string   "category_small"
    t.string   "category_size"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "credits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                   null: false
    t.text     "customer_id", limit: 65535
    t.text     "card_id",     limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_credits_on_user_id", using: :btree
  end

  create_table "exhibitors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",       null: false
    t.integer  "shipping_cost"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_exhibitors_on_user_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "image",           limit: 65535
    t.string   "name",                          null: false
    t.text     "explain",         limit: 65535, null: false
    t.integer  "price",                         null: false
    t.string   "status",                        null: false
    t.string   "shipping_which",                null: false
    t.string   "shipping_day",                  null: false
    t.string   "shipping_method",               null: false
    t.text     "shipping_region", limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "category_id",                   null: false
    t.integer  "bland_id"
    t.integer  "exhibitor_id",                  null: false
    t.integer  "buyer_id"
    t.index ["bland_id"], name: "index_items_on_bland_id", using: :btree
    t.index ["buyer_id"], name: "index_items_on_buyer_id", using: :btree
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["exhibitor_id"], name: "index_items_on_exhibitor_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "name",                   limit: 65535
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.integer  "number_of_exhibit"
    t.integer  "phone_number"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "firstname_kanji"
    t.string   "lastname_kanji"
    t.string   "firstname_kana"
    t.string   "lastname_kana"
    t.string   "birth_year"
    t.string   "birth_month"
    t.string   "birth_day"
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "buyers", "users"
  add_foreign_key "credits", "users"
  add_foreign_key "exhibitors", "users"
  add_foreign_key "items", "blands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "exhibitors"
end
