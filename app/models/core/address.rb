# == Schema Information
#
# Table name: core_addresses
#
#  id           :uuid             not null, primary key
#  address_one  :string           not null
#  address_two  :string
#  city         :string           not null
#  state_region :string           not null
#  country      :string           not null
#  postal_code  :string           not null
#  label        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Core::Address < ApplicationRecord

    #Associations
    has_many :locations
    has_and_belongs_to_many :contacts

    #Validations
    validates :address_one, presence: :true
    validates :city, presence: :true
    validates :state_region, presence: :true
    validates :country, presence: :true
    validates :postal_code, presence: :true
  end

