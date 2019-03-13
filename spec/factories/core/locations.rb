# == Schema Information
#
# Table name: core_locations
#
#  id          :uuid             not null, primary key
#  address_id  :uuid
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :location, class: 'Core::Location' do

    
    name { "location_#{Core::Location.count}" }
    description {"description_#{Core::Address.count}"}
    location_address {create(:address)}
    address_id {location_address.id}

    factory :location_without_address do
        address_id {nil}
    end
  end
end
