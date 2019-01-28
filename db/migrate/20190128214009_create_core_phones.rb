class CreateCorePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :core_phones do |t|

      t.timestamps
    end
  end
end
