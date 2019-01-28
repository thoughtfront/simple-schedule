class CreateCoreContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :core_contacts, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|
      t.string :prefix
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.string :suffix
      t.string :gender
      t.date :birth_date
      t.uuid :organization_id, null: false
      t.uuid :primary_email_id, null: false
      t.uuid :primary_phone_id
      t.uuid :primary_address_id
      t.timestamps
    end

    add_index :core_contacts, :organization_id
    add_index :core_contacts, :primary_email_id
    add_index :core_contacts, :primary_phone_id
    add_index :core_contacts, :primary_address_id
  end
end
