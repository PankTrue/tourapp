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

ActiveRecord::Schema.define(version: 2019_05_18_174746) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "pantronymic"
    t.string "gender"
    t.date "datebirth"
    t.string "phone"
    t.string "additional_phone"
    t.string "email"
    t.integer "main_passport_series"
    t.integer "main_passport_number"
    t.string "main_passport_get_by"
    t.date "main_passport_date_given"
    t.integer "international_passport_series"
    t.integer "international_passport_number"
    t.string "international_passport_get_by"
    t.date "international_passport_date_given"
    t.date "international_passport_date_end"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients_tours", id: false, force: :cascade do |t|
    t.integer "tour_id"
    t.integer "client_id"
    t.index ["client_id"], name: "index_clients_tours_on_client_id"
    t.index ["tour_id"], name: "index_clients_tours_on_tour_id"
  end

  create_table "tours", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "user_id"
    t.string "tour_operator"
    t.string "appeal"
    t.string "advertising_source"
    t.string "currency"
    t.boolean "passport_type"
    t.string "office_city"
    t.string "agency_represented"
    t.integer "number_person"
    t.string "tour_country"
    t.string "tour_city"
    t.date "date_start"
    t.date "date_end"
    t.string "hotel_name"
    t.date "hotel_start"
    t.date "hotel_end"
    t.string "room_category"
    t.string "type_room"
    t.string "type_food"
    t.string "route_there"
    t.string "route_back"
    t.integer "flight_number"
    t.string "fly_type"
    t.string "type_of_transport_there"
    t.string "type_of_transport_back"
    t.string "flight_type_there"
    t.string "flight_type_back"
    t.string "flight_back_class"
    t.integer "number_flight_back"
    t.string "transfer_route"
    t.string "transfer_type"
    t.string "excursion_program"
    t.string "additional_service"
    t.integer "cost_tour"
    t.integer "prepaid"
    t.string "voluntary_insurance"
    t.date "prihodnik_date"
    t.integer "prihodnik_prepaid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_tours_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "role_id", default: 0, null: false
    t.string "name"
    t.string "surname"
    t.string "pantronymic"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", limit: 8, null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
