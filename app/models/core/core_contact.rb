class Core::Contact < ApplicationRecord

  #Associations
  has_one :user
  # have_many :addresses
  # have_many :phones
  # have_many :emails
  # belong_to :organization
  # belong_to :primary_email
  # belong_to :primary_phone
  # belong_to :primary_address

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