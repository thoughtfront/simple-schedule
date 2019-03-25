require 'rails_helper'

RSpec.describe Core::EventsController, type: :controller do

    context 'create' do
        it 'works' do
            sign_in
            count = Core::Event.count
            event = build(:empty_event)
            location = build(:core_location)
            event_category = build(:core_event_category)
            post :create, params: {
                title: event.title,
                description: event.description,
                event_event_category: {
                    name: event_category.name,
                    description: event_category.description
                }
            }, format: :json
            puts(JSON.parse(response.body))

        end
    end

end
