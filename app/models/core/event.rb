class Core::Event < ApplicationRecord

  #Associations
  belongs_to :location, optional: true
  belongs_to :event_category, optional: true

  #Validations
  validates :title, presence: :true
  
end