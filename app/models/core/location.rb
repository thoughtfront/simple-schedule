class Core::Location < ApplicationRecord

  #Associations
  has_many :events
  belongs_to :address , optional: true

  #Validations
  validates :name, presence: :true
  
end
