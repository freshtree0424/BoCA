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

ActiveRecord::Schema.define(version: 2024_05_06_215907) do

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "attachment_answers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "attachment_id", null: false
    t.integer "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attachment_id"], name: "index_attachment_answers_on_attachment_id"
    t.index ["user_id"], name: "index_attachment_answers_on_user_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "question"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_attachments_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "controllabilities", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "question"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_controllabilities_on_category_id"
  end

  create_table "controllability_answers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "controllability_id", null: false
    t.integer "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["controllability_id"], name: "index_controllability_answers_on_controllability_id"
    t.index ["user_id"], name: "index_controllability_answers_on_user_id"
  end

  create_table "emotionalities", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "question"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_emotionalities_on_category_id"
  end

  create_table "emotionality_answers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "emotionality_id", null: false
    t.integer "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["emotionality_id"], name: "index_emotionality_answers_on_emotionality_id"
    t.index ["user_id"], name: "index_emotionality_answers_on_user_id"
  end

  create_table "extraversion_answers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "extraversion_id", null: false
    t.integer "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["extraversion_id"], name: "index_extraversion_answers_on_extraversion_id"
    t.index ["user_id"], name: "index_extraversion_answers_on_user_id"
  end

  create_table "extraversions", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "question"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_extraversions_on_category_id"
  end

  create_table "playabilities", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "question"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_playabilities_on_category_id"
  end

  create_table "playability_answers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "playability_id", null: false
    t.integer "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["playability_id"], name: "index_playability_answers_on_playability_id"
    t.index ["user_id"], name: "index_playability_answers_on_user_id"
  end

  create_table "post_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.string "star", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "score", precision: 5, scale: 3
  end

  create_table "tag_relationships", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_tag_relationships_on_post_id"
    t.index ["tag_id"], name: "index_tag_relationships_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "introduction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "view_counts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_view_counts_on_post_id"
    t.index ["user_id"], name: "index_view_counts_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attachment_answers", "attachments"
  add_foreign_key "attachment_answers", "users"
  add_foreign_key "attachments", "categories"
  add_foreign_key "controllabilities", "categories"
  add_foreign_key "controllability_answers", "controllabilities"
  add_foreign_key "controllability_answers", "users"
  add_foreign_key "emotionalities", "categories"
  add_foreign_key "emotionality_answers", "emotionalities"
  add_foreign_key "emotionality_answers", "users"
  add_foreign_key "extraversion_answers", "extraversions"
  add_foreign_key "extraversion_answers", "users"
  add_foreign_key "extraversions", "categories"
  add_foreign_key "playabilities", "categories"
  add_foreign_key "playability_answers", "playabilities"
  add_foreign_key "playability_answers", "users"
  add_foreign_key "tag_relationships", "posts"
  add_foreign_key "tag_relationships", "tags"
  add_foreign_key "view_counts", "posts"
  add_foreign_key "view_counts", "users"
end
