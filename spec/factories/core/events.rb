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

    title {'test_title'}
    description {'test_description'}
   
    factory :event_with_event_category do
      event_event_category {
        {
          name: 'event_category_name',
          description: 'event_category_description'
        }
      }
    end
    
    factory :empty_event do
      location_id {nil}
      event_category_id {nil}
    end
  end
end
