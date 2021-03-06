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

ActiveRecord::Schema.define(version: 20170326183006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "action_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "creative_actions", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "action_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "elements", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "excerpts", force: :cascade do |t|
    t.text     "full_text"
    t.text     "short_text"
    t.integer  "source_id"
    t.integer  "page_number"
    t.text     "commentary"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "time",        default: "00:00"
    t.integer  "user_id"
    t.index ["source_id"], name: "index_excerpts_on_source_id", using: :btree
  end

  create_table "goals", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.string   "title"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "notes"
    t.integer  "user_id"
    t.integer  "item_type",   default: 1
    t.datetime "due_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "next_steps", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "due_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "element_id"
    t.text     "summary"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.integer  "year"
    t.string   "author"
    t.text     "summary"
    t.string   "publisher"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "source_type", default: "book"
    t.string   "url"
    t.integer  "user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "access_token"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "excerpts", "sources"
end
