# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091012192604) do

  create_table "locations", :force => true do |t|
    t.float   "lat",     :null => false
    t.float   "lng",     :null => false
    t.integer "post_id"
  end

  create_table "photos", :force => true do |t|
    t.string   "image_filename"
    t.integer  "image_width"
    t.integer  "image_height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.datetime "start",                           :null => false
    t.datetime "finish"
    t.string   "title",                           :null => false
    t.text     "content"
    t.string   "place_string"
    t.string   "remote_ref"
    t.integer  "trip_id",                         :null => false
    t.string   "remote_source_id", :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_id"
  end

  create_table "trips", :force => true do |t|
    t.string   "title",                   :limit => 60,                 :null => false
    t.string   "description",                           :default => ""
    t.integer  "user_id",                                               :null => false
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "top_right_location_id"
    t.integer  "bottom_left_location_id"
  end

  create_table "users", :force => true do |t|
    t.text     "profile"
    t.integer  "photo_id"
    t.integer  "location_id"
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                    :default => "passive"
    t.datetime "deleted_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
