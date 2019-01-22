class Core::Location < ApplicationRecord
    # belongs_to :event
    :address_id
    validates :name, presence: :true
end
