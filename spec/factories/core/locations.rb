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

    factory :location_without_address do
        address_id {nil}
    end

    factory :location_with_location_address do 
       location_address {
         {
            address_one: 'address_one',
            address_two: 'address_two',
            city: 'DeKalb',
            state_region: 'Illinois',
            country: 'US',
            postal_code: '69876',
            label: 'label'
         }
       }
    end
  end
end
