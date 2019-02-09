class CreateCoreLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :core_locations, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|
      t.uuid :address_id
      t.string :name
      t.text :description

      t.timestamps
    end

    add_index :core_locations, :address_id
  end
end
