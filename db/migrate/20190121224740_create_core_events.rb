class CreateCoreEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :core_events, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|
      t.uuid :location_id
      t.uuid :event_category_id
      t.string :title
      t.text :description

      t.timestamps
    end

    add_index :core_events, :location_id
    add_index :core_events, :event_category_id
  end
end
