# == Schema Information
#
# Table name: core_phones
#
#  id         :uuid             not null, primary key
#  value      :string
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Core::Phone < ApplicationRecord
    
    #Associations
    has_and_belongs_to_many :contacts
    has_one :organization

    #Validations
    validates :value, presence: :true
    
end
