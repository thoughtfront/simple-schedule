FactoryBot.define do
  factory :core_event, class: 'Core::Event' do
    title 'test-title'
    description 'test description'
    event_id {Core::Event.count}
    location_id {Core::Event.count}
    event_category_id {Core::Event.count}
  end
end
