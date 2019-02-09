# == Schema Information
#
# Table name: core_organizations
#
#  id                 :uuid             not null, primary key
#  name               :string           not null
#  description        :text
#  primary_contact_id :uuid
#  primary_email_id   :uuid             not null
#  primary_address_id :uuid
#  primary_phone_id   :uuid
#  status             :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Core::Organization < ApplicationRecord

  #Associations
  has_many :contacts
  belongs_to :primary_contact, class_name: Core::Contact.name, optional: true
  belongs_to :primary_email, class_name: Core::Email.name
  belongs_to :primary_address, class_name: Core::Address.name, optional: true
  belongs_to :primary_phone, class_name: Core::Phone.name, optional: true

  #Validations
  validates :name, presence: true
  validates :primary_email_id, presence: true
  validates :status, presence: true

end
