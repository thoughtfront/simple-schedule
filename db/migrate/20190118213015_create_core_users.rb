class CreateCoreUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :core_users, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false

      # Adding some extra functionality
      t.datetime :locked_at
      t.inet :last_sign_in_ip
      t.datetime :last_sign_in_at

      t.uuid :contact_id

      t.timestamps null: false
    end
  end
end
