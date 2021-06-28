# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_01_011309) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "newswire_post_id", null: false
    t.integer "member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"member\", \"created_at\"", name: "find_comments_by_member"
    t.index "\"member\", \"newswire_post\", \"created_at\"", name: "find_unique_comment", unique: true
    t.index "\"newswire_post\", \"created_at\"", name: "find_comments_by_newswire_post"
    t.index ["member_id"], name: "index_comments_on_member_id"
    t.index ["newswire_post_id"], name: "index_comments_on_newswire_post_id"
  end

  create_table "enquiries", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_no"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
  end

  create_table "lessons", force: :cascade do |t|
    t.date "date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "instructor_id", null: false
    t.integer "facility_id", null: false
    t.integer "programme_id", null: false
    t.boolean "is_expired", default: false
    t.string "level"
    t.index ["facility_id"], name: "index_lessons_on_facility_id"
    t.index ["instructor_id"], name: "index_lessons_on_instructor_id"
    t.index ["programme_id"], name: "index_lessons_on_programme_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "user_name"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_no"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["user_name"], name: "index_members_on_user_name", unique: true
  end

  create_table "newswire_posts", force: :cascade do |t|
    t.text "content"
    t.integer "member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"member\", \"created_at\"", name: "index_newswire_posts_on_member_and_created_at"
    t.index ["member_id"], name: "index_newswire_posts_on_member_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "store_item_id", null: false
    t.integer "order_id", null: false
    t.integer "quantity"
    t.decimal "unit_price"
    t.decimal "sub_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["store_item_id"], name: "index_order_items_on_store_item_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "member_id", null: false
    t.decimal "total"
    t.boolean "is_paid", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_orders_on_member_id"
  end

  create_table "programmes", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.string "quotation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.integer "lesson_id", null: false
    t.integer "subscription_id", null: false
    t.integer "member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_registrations_on_lesson_id"
    t.index ["member_id"], name: "index_registrations_on_member_id"
    t.index ["subscription_id"], name: "index_registrations_on_subscription_id"
  end

  create_table "store_items", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "subscription_name"
    t.integer "membership_id", null: false
    t.integer "member_id", null: false
    t.datetime "expiry_date"
    t.boolean "is_active", default: true
    t.string "registration_limit", default: "Unlimited"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_subscriptions_on_member_id"
    t.index ["membership_id"], name: "index_subscriptions_on_membership_id"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "city"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "content"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "members"
  add_foreign_key "comments", "newswire_posts"
  add_foreign_key "lessons", "facilities"
  add_foreign_key "lessons", "instructors"
  add_foreign_key "lessons", "programmes"
  add_foreign_key "newswire_posts", "members"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "store_items"
  add_foreign_key "orders", "members"
  add_foreign_key "registrations", "lessons"
  add_foreign_key "registrations", "members"
  add_foreign_key "registrations", "subscriptions"
  add_foreign_key "subscriptions", "members"
  add_foreign_key "subscriptions", "store_items", column: "membership_id"
end
