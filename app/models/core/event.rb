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
  attribute :event_category

  #Callbacks
  before_create :create_location
  before_create :create_event_category

  private
    def create_location

    end

    def create_event_category
      
    end
  
end
