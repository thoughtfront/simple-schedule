class CreateCoreAddressesContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :core_addresses_contacts, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|  
      t.uuid :address_id
      t.uuid :contact_id
    end
  end
end
