class Core::EventCategory < ApplicationRecord

  #Associations
  has_many :events

  #Validations
  validates :name, presence: :true

end