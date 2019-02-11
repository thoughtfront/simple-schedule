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

ActiveRecord::Schema.define(version: 2019_02_09_225734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "core_addresses", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "address_one", null: false
    t.string "address_two"
    t.string "city", null: false
    t.string "state_region", null: false
    t.string "country", null: false
    t.string "postal_code", null: false
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "core_addresses_contacts", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "address_id"
    t.uuid "contact_id"
    t.index ["address_id"], name: "index_core_addresses_contacts_on_address_id"
    t.index ["contact_id"], name: "index_core_addresses_contacts_on_contact_id"
  end

  create_table "core_contacts", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "prefix"
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.string "suffix"
    t.string "gender"
    t.date "birth_date"
    t.uuid "organization_id", null: false
    t.uuid "primary_email_id", null: false
    t.uuid "primary_phone_id"
    t.uuid "primary_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_core_contacts_on_organization_id"
    t.index ["primary_address_id"], name: "index_core_contacts_on_primary_address_id"
    t.index ["primary_email_id"], name: "index_core_contacts_on_primary_email_id"
    t.index ["primary_phone_id"], name: "index_core_contacts_on_primary_phone_id"
  end

  create_table "core_contacts_emails", force: :cascade do |t|
    t.uuid "contact_id"
    t.uuid "email_id"
    t.index ["contact_id"], name: "index_core_contacts_emails_on_contact_id"
    t.index ["email_id"], name: "index_core_contacts_emails_on_email_id"
  end

  create_table "core_contacts_phones", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "phone_id"
    t.string "contact_id"
    t.index ["contact_id"], name: "index_core_contacts_phones_on_contact_id"
    t.index ["phone_id"], name: "index_core_contacts_phones_on_phone_id"
  end

  create_table "core_emails", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "value", null: false
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "core_event_categories", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "core_events", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "location_id"
    t.uuid "event_category_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_category_id"], name: "index_core_events_on_event_category_id"
    t.index ["location_id"], name: "index_core_events_on_location_id"
  end

  create_table "core_locations", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "address_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_core_locations_on_address_id"
  end

  create_table "core_organizations", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.uuid "primary_contact_id"
    t.uuid "primary_email_id", null: false
    t.uuid "primary_address_id"
    t.uuid "primary_phone_id"
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["primary_address_id"], name: "index_core_organizations_on_primary_address_id"
    t.index ["primary_contact_id"], name: "index_core_organizations_on_primary_contact_id"
    t.index ["primary_email_id"], name: "index_core_organizations_on_primary_email_id"
    t.index ["primary_phone_id"], name: "index_core_organizations_on_primary_phone_id"
  end

  create_table "core_phones", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "value"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "core_users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.datetime "locked_at"
    t.inet "last_sign_in_ip"
    t.datetime "last_sign_in_at"
    t.uuid "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_core_users_on_contact_id"
  end

end
