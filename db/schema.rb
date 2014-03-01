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

ActiveRecord::Schema.define(version: 20140216004941) do

  create_table "comments", force: true do |t|
    t.text     "text"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "epost_id"
  end

  create_table "ecomments", force: true do |t|
    t.text     "text"
    t.integer  "epost_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ecomments", ["epost_id"], name: "index_ecomments_on_epost_id"
  add_index "ecomments", ["user_id"], name: "index_ecomments_on_user_id"

  create_table "eposts", force: true do |t|
    t.string   "about"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "eposts", ["user_id"], name: "index_eposts_on_user_id"

  create_table "flaggings", force: true do |t|
    t.string   "flaggable_type"
    t.integer  "flaggable_id"
    t.string   "flagger_type"
    t.integer  "flagger_id"
    t.string   "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flaggings", ["flag", "flaggable_type", "flaggable_id"], name: "index_flaggings_on_flag_and_flaggable_type_and_flaggable_id"
  add_index "flaggings", ["flag", "flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], name: "access_flag_flaggings"
  add_index "flaggings", ["flaggable_type", "flaggable_id"], name: "index_flaggings_on_flaggable_type_and_flaggable_id"
  add_index "flaggings", ["flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], name: "access_flaggings"

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "like"
    t.integer  "epost_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["epost_id"], name: "index_likes_on_epost_id"
  add_index "likes", ["post_id"], name: "index_likes_on_post_id"
  add_index "likes", ["user_id", "epost_id"], name: "index_likes_on_user_id_and_epost_id", unique: true
  add_index "likes", ["user_id", "post_id"], name: "index_likes_on_user_id_and_post_id", unique: true
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "permissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "thing_id"
    t.string   "thing_type"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "designer"
    t.text     "about"
    t.string   "contact_details"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "relashionships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relashionships", ["followed_id"], name: "index_relashionships_on_followed_id"
  add_index "relashionships", ["follower_id", "followed_id"], name: "index_relashionships_on_follower_id_and_followed_id", unique: true
  add_index "relashionships", ["follower_id"], name: "index_relashionships_on_follower_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "status"
    t.string   "intrests"
    t.integer  "age"
    t.text     "bio"
    t.string   "name"
    t.boolean  "like"
    t.integer  "likes"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
