# == Schema Information
#
# Table name: core_emails
#
#  id         :bigint(8)        not null, primary key
#  value      :string           not null
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :core_email, class: 'Core::Email' do

    value {'test-value@email.com'}
    
  end
end
