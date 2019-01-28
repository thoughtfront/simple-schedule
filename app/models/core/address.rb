class Core::Address < ApplicationRecord

    #Associations
    has_many :locations
    # has_many :contacts

    #Validations
    validates :address_one, presence: :true
    validates :city, presence: :true
    validates :state_region, presence: :true
    validates :country, presence: :true
    validates :postal_code, presence: :true

  end

