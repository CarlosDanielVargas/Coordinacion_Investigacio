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

ActiveRecord::Schema[7.0].define(version: 2023_04_25_235814) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "agreements", force: :cascade do |t|
    t.string "code", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "articles_id"
    t.index ["articles_id"], name: "index_agreements_on_articles_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "minute_id"
    t.integer "project_id"
    t.index ["minute_id"], name: "index_articles_on_minute_id"
    t.index ["project_id"], name: "index_articles_on_project_id"
  end

  create_table "investigators", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "id_card", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "minutes", force: :cascade do |t|
    t.integer "number", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_investigators", force: :cascade do |t|
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.integer "investigator_id"
    t.index ["investigator_id"], name: "index_project_investigators_on_investigator_id"
    t.index ["project_id"], name: "index_project_investigators_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "preAcceptanceCode"
    t.string "finalCode"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "agreements_id"
    t.index ["agreements_id"], name: "index_transactions_on_agreements_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "phone", null: false
    t.string "id_card", null: false
    t.integer "role", default: 0, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agreements", "articles", column: "articles_id"
  add_foreign_key "articles", "minutes"
  add_foreign_key "articles", "projects"
  add_foreign_key "project_investigators", "investigators"
  add_foreign_key "project_investigators", "projects"
  add_foreign_key "transactions", "agreements", column: "agreements_id"
end
