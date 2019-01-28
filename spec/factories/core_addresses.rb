FactoryBot.define do
  factory :core_address, class: 'Core::Address' do

    address_one {"#{Address.count} Main Street"}
    city {"Cityville"}
    state_region {"Illinois"}
    country {"United States"}
    postal_code {"61234"}

  end
end
