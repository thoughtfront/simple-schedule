class CreateCoreContactsEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :core_contacts_emails do |t|
      t.uuid :contact_id
      t.uuid :email_id
    end

    add_index :core_contacts_emails, :contact_id
    add_index :core_contacts_emails, :email_id
  end
end
