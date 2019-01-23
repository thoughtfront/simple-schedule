class CreateCoreLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :core_locations do |t|
      t.belongs_to :event
      t.string :name
      t.timestamps
    end

  end
end
