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

ActiveRecord::Schema.define(version: 20140127020537) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.text     "description"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "token_auth",  default: true
    t.string   "password"
    t.string   "email"
    t.string   "slug"
  end

  add_index "accounts", ["slug"], name: "index_accounts_on_slug", unique: true

  create_table "accounts_users", force: true do |t|
    t.integer "account_id"
    t.integer "user_id"
  end

  create_table "tickets", force: true do |t|
    t.integer  "nice_id"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "external_id"
    t.string   "type"
    t.text     "description"
    t.string   "priority"
    t.string   "status"
    t.string   "recipient"
    t.integer  "requester_id"
    t.string   "submitter_id"
    t.string   "assignee_id"
    t.string   "organization_id"
    t.string   "group_id"
    t.text     "collaborator_ids"
    t.integer  "forum_topic_id"
    t.integer  "problem_id"
    t.boolean  "has_incidents"
    t.datetime "due_at"
    t.text     "tags"
    t.text     "via"
    t.text     "custom_fields"
    t.text     "satisfaction_rating"
    t.text     "sharing_agreement_ids"
    t.text     "followup_ids"
    t.integer  "ticket_form_id"
    t.datetime "created_at_orig"
    t.datetime "updated_at_orig"
    t.integer  "account_id"
  end

  add_index "tickets", ["account_id"], name: "index_tickets_on_account_id"
  add_index "tickets", ["external_id"], name: "index_tickets_on_external_id"
  add_index "tickets", ["nice_id"], name: "index_tickets_on_nice_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "users_accounts", force: true do |t|
    t.integer "user_id"
    t.integer "account_id"
  end

end
