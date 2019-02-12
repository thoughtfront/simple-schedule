class CoreContactsPhones < ActiveRecord::Migration[5.2]
  def change
    create_table :core_contacts_phones, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|
      t.uuid :phone_id
      t.uuid :contact_id
    end

    add_index :core_contacts_phones, :phone_id
    add_index :core_contacts_phones, :contact_id
  end
end
