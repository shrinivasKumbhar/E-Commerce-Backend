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

ActiveRecord::Schema.define(version: 20170117174235) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "api_keys", force: :cascade do |t|
    t.boolean  "is_active",                default: true
    t.integer  "user_id",      limit: 4
    t.string   "access_token", limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "areas", force: :cascade do |t|
    t.boolean  "is_active",              default: true
    t.string   "name",       limit: 255
    t.string   "pincode",    limit: 6
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "attribute_masters", force: :cascade do |t|
    t.boolean  "is_active",               default: true
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "carts", force: :cascade do |t|
    t.boolean  "is_active",                           default: true
    t.integer  "user_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.decimal  "quantity",             precision: 10
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "categories", force: :cascade do |t|
    t.boolean  "is_active"
    t.string   "name",               limit: 255
    t.integer  "parent_category_id", limit: 4
    t.integer  "created_by",         limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "otp_stores", force: :cascade do |t|
    t.boolean  "is_active",             default: true
    t.string   "contact_no", limit: 15
    t.string   "otp",        limit: 8
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "user_id",    limit: 4
  end

  create_table "product_images", force: :cascade do |t|
    t.boolean  "is_active",                   default: true
    t.integer  "product_id",      limit: 4
    t.string   "image_url",       limit: 255
    t.string   "thumb_image_url", limit: 255
    t.integer  "created_by",      limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "is_profile",                  default: false
  end

  create_table "products", force: :cascade do |t|
    t.boolean  "is_active",                               default: true
    t.integer  "category_id",  limit: 4
    t.string   "name",         limit: 255
    t.string   "display_name", limit: 255
    t.string   "description",  limit: 500
    t.decimal  "price",                    precision: 10
    t.decimal  "discount",                 precision: 10
    t.integer  "created_by",   limit: 4
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  create_table "societies", force: :cascade do |t|
    t.boolean  "is_active",               default: true
    t.integer  "area_id",     limit: 4
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "subscription_packages", force: :cascade do |t|
    t.boolean  "is_active",                                        default: true
    t.integer  "subscription_packs_id", limit: 4
    t.string   "days",                  limit: 255
    t.decimal  "price",                             precision: 10
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  create_table "subscription_packs", force: :cascade do |t|
    t.boolean  "is_active",                  default: true
    t.string   "name",           limit: 255
    t.integer  "parent_pack_id", limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "tags", force: :cascade do |t|
    t.boolean  "is_active",             default: true
    t.string   "name",       limit: 20
    t.integer  "created_by", limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "user_addresses", force: :cascade do |t|
    t.boolean  "is_active",              default: true
    t.integer  "user_id",    limit: 4
    t.integer  "society_id", limit: 4
    t.string   "address1",   limit: 255
    t.string   "address2",   limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "user_otp_checks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "is_active",                 default: true
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.string   "email",         limit: 255
    t.string   "mobile_no",     limit: 15
    t.string   "signup_type",   limit: 5
    t.string   "password",      limit: 500
    t.string   "password_salt", limit: 500
    t.string   "password_hash", limit: 500
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "is_verified",               default: false
  end

  create_table "users_societies", force: :cascade do |t|
    t.boolean  "is_active",            default: true
    t.integer  "user_id",    limit: 4
    t.integer  "society_id", limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

end
