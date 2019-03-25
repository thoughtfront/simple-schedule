# == Schema Information
#
# Table name: core_events
#
#  id                :uuid             not null, primary key
#  location_id       :uuid
#  event_category_id :uuid
#  title             :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Core::Event < ApplicationRecord

  #Associations
  belongs_to :location, optional: true
  belongs_to :event_category, optional: true

  #Validations
  validates :title, presence: :true

  #Attributes 
  attribute :event_location
  attribute :event_event_category
  attribute :location_address

  #Callbacks
  # before_create :create_location
  before_create :create_event_category

  def attributes
    {
      "id" => self.id,
      "title" => self.title,
      "description" => self.description,
      "event_location" => self.location,
      "event_category" => self.event_event_category
    }
  end


  private
    def create_location
      location = nil
      if self.event_location !=nil
        location = Core::Location.new(self.location_address)
        if location.save
          self.location_id = location.id
        else
          self.errors.add("Location error", messages: location.errors.messages)
          throw :abort
        end
      else
        self.errors.add("location error", messages: "location is empty")
        throw :abort
      end
    end

    def create_event_category
      event_category = nil
      if self.event_event_category != nil
        event_category = Core::EventCategory.new(self.event_event_category)
        if event_category.save
          self.event_category_id = event_category.id
        else
          self.errors.add("Event Category error", messages: event_category.errors.messages)
          throw :abort
        end
      else
        self.errors.add("Event Category error", messages: "Event Category is empty")
        throw :abort
      end
    end
  
end
