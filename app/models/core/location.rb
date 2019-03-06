# == Schema Information
#
# Table name: core_locations
#
#  id          :uuid             not null, primary key
#  address_id  :uuid
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Core::Location < ApplicationRecord

  #Associations
  has_many :events
  belongs_to :address , optional: true
  accepts_nested_attributes_for :address, :allow_destroy => true, :update_only => true

  #Validations
  validates :name, presence: :true
  
end
