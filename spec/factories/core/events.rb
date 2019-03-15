# == Schema Information
#
# Table name: core_events
#
#  id                :uuid             not null, primary key
#  location_id       :uuid
#  event_category_id :uuid
#  title             :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryBot.define do
  factory :event, class: 'Core::Event' do

    title {'test-title'}
    description {'test description'}
    location_id {create(:core_location).id}
    event_category_id{create(:core_event_category).id}

    factory :empty_event, class: 'Core::Event' do
      location_id {nil}
      event_category_id {nil}
    end
  end
end
