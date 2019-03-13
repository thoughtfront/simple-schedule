# == Schema Information
#
# Table name: core_addresses
#
#  id           :uuid             not null, primary key
#  address_one  :string           not null
#  address_two  :string
#  city         :string           not null
#  state_region :string           not null
#  country      :string           not null
#  postal_code  :string           not null
#  label        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :address, class: 'Core::Address' do

    address_one {"#{Core::Address.count} Main Street"}
    address_two {"#{Core::Address.count} Main Street"}
    city {"Cityville"}
    state_region {"Illinois"}
    country {"United States"}
    postal_code {"61234"}

  end

  factory :empty_address, class: 'Core::Address' do
    address_one {nil}
    state_region {nil}
    country {nil}
    postal_code {nil}
    label {nil}

  end
end
