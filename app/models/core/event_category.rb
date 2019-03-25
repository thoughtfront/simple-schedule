# == Schema Information
#
# Table name: core_event_categories
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Core::EventCategory < ApplicationRecord

  #Associations
  has_many :events

  #Validations
  validates :name, presence: :true

  def attributes
    {
      "id" => self.id,
      "description" => self.description
    }
  
  end

end
