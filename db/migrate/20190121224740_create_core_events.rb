class CreateCoreEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :core_events do |t|
      t.text :description
      t.integer :event_id
      t.integer :location_id
      t.integer :event_category_id
      t.string :title
      t.timestamps
    end
  end
end
