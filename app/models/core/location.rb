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
  before_update :update_address

  def attributes 
    {
      'id'=> self.id,
      'address_id' => self.address_id,
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
          self.errors.add(:address_error, messages: address.errors.messages)
          throw :abort
        end
      else
        self.errors.add(:location_error, messages: "location_address is empty")
        throw :abort
      end
    end

    def update_address
      if location_address != nil
        if Core::Address.exists?(location_address)
          puts(Core::Address.exists?(location_address))
          address = Core::Address.find(location_address)
          self.address_id = address.id
          self.save
        else
          create_address
        end
        # self.address.assign_attributes(location_address)
        # self.address.save
      else
        self.errors.add(:location_error, messages: "location_address is empty")
      end
    end

end
