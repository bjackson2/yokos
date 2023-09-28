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

ActiveRecord::Schema[7.0].define(version: 2023_09_28_134653) do
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

  create_table "albums", force: :cascade do |t|
    t.string "title", null: false
    t.string "file_under"
    t.date "release_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "artist_id"
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.string "file_under"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listening_session_albums", force: :cascade do |t|
    t.integer "listening_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "album_id", null: false
    t.integer "yokos_member_id"
    t.index ["album_id"], name: "index_listening_session_albums_on_album_id"
    t.index ["listening_session_id"], name: "index_listening_session_albums_on_listening_session_id"
    t.index ["yokos_member_id"], name: "index_listening_session_albums_on_yokos_member_id"
  end

  create_table "listening_sessions", force: :cascade do |t|
    t.date "date"
    t.string "session_type", null: false
    t.string "theme"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "locked_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "yokos_member_listening_sessions", force: :cascade do |t|
    t.integer "yokos_member_id"
    t.integer "listening_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listening_session_id"], name: "index_yokos_member_listening_sessions_on_listening_session_id"
    t.index ["yokos_member_id"], name: "index_yokos_member_listening_sessions_on_yokos_member_id"
  end

  create_table "yokos_members", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_yokos_members_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "listening_session_albums", "albums"
  add_foreign_key "listening_session_albums", "listening_sessions"
  add_foreign_key "listening_session_albums", "yokos_members"
  add_foreign_key "yokos_member_listening_sessions", "listening_sessions"
  add_foreign_key "yokos_member_listening_sessions", "yokos_members"
  add_foreign_key "yokos_members", "users"
end
