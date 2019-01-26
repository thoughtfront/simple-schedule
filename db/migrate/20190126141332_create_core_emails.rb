class CreateCoreEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :core_emails do |t|

      t.timestamps
    end
  end
end
