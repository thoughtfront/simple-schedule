class CreateCoreOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :core_organizations, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|
      t.string :name, null: false
      t.text :description
      t.uuid :primary_contact_id
      t.uuid :primary_email_id, null: false
      t.uuid :primary_address_id
      t.uuid :primary_phone_id
      t.string :status, null: false
      t.timestamps
    end
  end
end
