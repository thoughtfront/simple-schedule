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
  
end
