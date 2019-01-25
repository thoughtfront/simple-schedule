class Core::Event < ApplicationRecord

  #Associations
  belongs_to :location, optional: true

  #Validations
  validates :title, presence: :true
  
end