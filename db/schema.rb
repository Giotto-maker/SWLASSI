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

ActiveRecord::Schema.define(version: 2020_09_07_075313) do

  create_table "admin_creations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "artwork_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artworks", force: :cascade do |t|
    t.integer "voto"
    t.integer "valutazioni"
    t.string "periodo"
    t.string "nome"
    t.string "indirizzo"
    t.string "foto5"
    t.string "foto4"
    t.string "foto3"
    t.string "foto2"
    t.string "foto1"
    t.string "autore"
    t.string "dimensioni"
    t.string "categoria"
    t.float "latitudine"
    t.float "longitudine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deletions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "artwork_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itineraries", force: :cascade do |t|
    t.integer "artwork1_id"
    t.integer "artwork2_id"
    t.integer "artwork3_id"
    t.integer "artwork4_id"
    t.integer "artwork5_id"
    t.integer "artwork6_id"
    t.integer "artwork7_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lover_creations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "artwork_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "valutation"
    t.text "comment"
    t.integer "user_id"
    t.integer "artwork_id"
    t.datetime "updated_at", default: "2020-08-19 18:42:57"
    t.index ["artwork_id"], name: "index_reviews_on_artwork_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "surname"
    t.string "username"
    t.string "category"
    t.string "provider"
    t.string "uid"
    t.integer "roles_mask"
    t.integer "reviews_number", default: 0
    t.boolean "account_active", default: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
