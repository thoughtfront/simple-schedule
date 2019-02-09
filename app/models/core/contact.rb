# == Schema Information
#
# Table name: core_contacts
#
#  id                 :uuid             not null, primary key
#  prefix             :string
#  first_name         :string           not null
#  middle_name        :string
#  last_name          :string           not null
#  suffix             :string
#  gender             :string
#  birth_date         :date
#  organization_id    :uuid             not null
#  primary_email_id   :uuid             not null
#  primary_phone_id   :uuid
#  primary_address_id :uuid
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Core::Contact < ApplicationRecord

  #Associations
  has_one :user
  # have_many :addresses
  has_and_belongs_to_many :phones
  # have_many :emails
  belongs_to :organization
  belongs_to :primary_email, class_name: Core::Email.name
  belongs_to :primary_phone, class_name: Core::Phone.name, optional: true
  belongs_to :primary_address, class_name: Core::Address.name, optional: true

  #Validations
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  # validates :organization_id, presence: :true
  # validates :primary_email_id, presence: :true
  # validate :primary_email_matches_user


  protected

  # def primary_email_matches_user
  #   if user.email != primary_email_id
  #     errors.add(:primary_email_id, "Must be the same as the user id")
  #   end
  # end

end