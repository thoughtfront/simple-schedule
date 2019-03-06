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
  factory 'core/location', class: 'Core::Location' do

    address_id {create(:core_address).id}
    name { "location_#{Core::Location.count}" }
    description {"description_#{Core::Address.count}"}
  end
end
