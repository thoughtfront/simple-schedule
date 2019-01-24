class Core::Location < ApplicationRecord
    has_many :events
    belongs_to :address , optional: true
    validates :name, presence: :true
    :location_id
end
