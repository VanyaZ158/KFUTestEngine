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

ActiveRecord::Schema.define(version: 20170509115650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "materials", force: :cascade do |t|
    t.text "short_description"
    t.text "text_in_markdown"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_materials_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.text "title"
    t.text "short_description"
    t.integer "questions_per_test"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_topics_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.text "username"
    t.text "password_digest"
    t.text "first_name"
    t.text "last_name"
    t.text "patronymic"
    t.boolean "is_teacher"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
