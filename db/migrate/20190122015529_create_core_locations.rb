class CreateCoreLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :core_locations, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
