class CreateCorePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :core_addresses, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|  
      t.value
      t.label

      t.timestamps
    end
  end
end
