# == Schema Information
#
# Table name: core_emails
#
#  id         :uuid             not null, primary key
#  value      :string           not null
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Core::Email < ApplicationRecord

    #Associations
    has_one :user
    # has_one :organization

    #Validations
    validates :value, presence: :true
    
  end
  
