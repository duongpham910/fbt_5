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

ActiveRecord::Schema.define(version: 20161118055757) do

  create_table "bank_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "card_type"
    t.string   "owner_name"
    t.string   "card_num"
    t.integer  "bank_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_bank_cards_on_bank_id", using: :btree
    t.index ["user_id"], name: "index_bank_cards_on_user_id", using: :btree
  end

  create_table "banks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "num_tourist"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_address"
    t.text     "description",     limit: 65535
    t.float    "total_price",     limit: 24
    t.integer  "status"
    t.integer  "tour_id"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["tour_id"], name: "index_bookings_on_tour_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",    limit: 65535
    t.integer  "parent_id"
    t.integer  "review_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["review_id"], name: "index_comments_on_review_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.integer  "booking_id"
    t.integer  "bank_card_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["bank_card_id"], name: "index_payments_on_bank_card_id", using: :btree
    t.index ["booking_id"], name: "index_payments_on_booking_id", using: :btree
  end

  create_table "places", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "place_type"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "rate"
    t.integer  "user_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["rateable_type", "rateable_id"], name: "index_ratings_on_rateable_type_and_rateable_id", using: :btree
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "review_type"
    t.text     "content",     limit: 65535
    t.integer  "user_id"
    t.integer  "tour_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["tour_id"], name: "index_reviews_on_tour_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "tour_places", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "tour_id"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_tour_places_on_place_id", using: :btree
    t.index ["tour_id"], name: "index_tour_places_on_tour_id", using: :btree
  end

  create_table "tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "price_per_person", limit: 24
    t.text     "description",      limit: 65535
    t.integer  "num_people"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "status"
    t.float    "discount",         limit: 24
    t.integer  "category_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["category_id"], name: "index_tours_on_category_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "avatar"
    t.boolean  "is_admin"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bank_cards", "banks"
  add_foreign_key "bank_cards", "users"
  add_foreign_key "bookings", "tours"
  add_foreign_key "bookings", "users"
  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "payments", "bank_cards"
  add_foreign_key "payments", "bookings"
  add_foreign_key "ratings", "users"
  add_foreign_key "reviews", "tours"
  add_foreign_key "reviews", "users"
  add_foreign_key "tour_places", "places"
  add_foreign_key "tour_places", "tours"
  add_foreign_key "tours", "categories"
end
