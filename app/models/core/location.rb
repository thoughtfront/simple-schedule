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

  #Attribures
  attribute :location_address
  
  #Callbacks
  before_create :create_address

  def attributes 
    {
      'id'=> self.id,
      'name' => self.name,
      'description' => self.description,
      'location_address' => self.address
    }
  end

  private 

    def create_address
      address = nil
      if self.location_address != nil
        address = Core::Address.new(self.location_address)
        if address.save
          self.address_id = address.id
        else
          address_errors = address.errors
          self.errors.add("address error", messages: address.errors.messages)
          throw :abort
        end
      else
        self.errors.add("address error", messages: "address is empty")
        throw :abort
      end
    end
end
