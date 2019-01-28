class Core::Phone < ApplicationRecord
    
    #Associations
    has_many :contacts
    has_one :organization

    #Validations
    validates :value, presence: :true
    
end
