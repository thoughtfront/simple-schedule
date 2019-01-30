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

FactoryBot.define do
    factory :core_phone, class: 'Core::Phone' do

        value {"Test Value"}
        label {"Test Label"}
    end
end
