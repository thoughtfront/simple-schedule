class Core::Location < ApplicationRecord
    has_many :events
    validates :name, presence: :true
    :location_id
end
