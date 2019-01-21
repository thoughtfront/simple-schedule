FactoryBot.define do
    factory :event do
      title 'test-title'
      event_category_id {Event.count}
      location_id {Event.count} 
      description {"event_description#{Event.count}"}
    end
  end