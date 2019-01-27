class Core::Email < ApplicationRecord

    #Associations
    has_one :user
    # has_one :organization

    #Validations
    validates :value, presence: :true
    
  end
  