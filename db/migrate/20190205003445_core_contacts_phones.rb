class CoreContactsPhones < ActiveRecord::Migration[5.2]
  def change
    create_table :core_contacts_phones, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|  
      t.string :phone_id
      t.string :contact_id

      t.timestamps
    end
  end
end
