class CreateCoreAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :core_addresses, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|
      t.string :address_one, null: false
      t.string :address_two
      t.string :city, null: false
      t.string :state_region, null: false
      t.string :country, null: false
      t.string :postal_code, null: false
      t.string :label
      t.timestamps
    end
  end
end
