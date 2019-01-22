class CreateCoreEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :core_events do |t|
      t.string :title
      t.timestamps
    end
  end
end
