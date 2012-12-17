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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121216183356) do

  create_table "campaigns", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "goal_in_cents"
    t.datetime "end_date"
    t.integer  "user_id"
    t.string   "campaign_type"
  end

  create_table "donation_requests", :force => true do |t|
    t.integer "campaign_id"
    t.string  "order_id"
    t.string  "currency"
    t.integer "amount_in_cents"
    t.string  "token"
  end

  create_table "donations", :force => true do |t|
    t.integer "campaign_id"
    t.string  "order_id"
    t.string  "currency"
    t.integer "amount_in_cents"
    t.string  "payer_email"
    t.string  "payer_first_name"
    t.string  "payer_last_name"
    t.string  "transaction_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.integer  "amount_raised_in_cents"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
