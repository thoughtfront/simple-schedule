class Core::Event < ApplicationRecord
     belongs_to :location, optional: true
     validates :title, presence: :true
     :location_id
end
