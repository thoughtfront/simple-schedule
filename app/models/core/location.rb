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
  
  #Validations
  validates :name, presence: :true

  attribute :location_address

  def attributes 
    {
      'id'=> self.id,
      'name' => self.name,
      'description' => self.description,
      'location_address' => self.address
      # 'location_address' => {
      #   'address_one' => self.address.address_one,
      #   'address_two' => self.address.address_two,
      #   'city' => self.address.city,
      #   'state_region' => self.address.state_region,
      #   'country' => self.address.country,
      #   'postal_code' => self.address.postal_code,
      #   'label' => self.address.label 
      # }
    }
  end
end
