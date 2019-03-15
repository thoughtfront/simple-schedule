require 'rails_helper'

RSpec.describe Core::EventsController, type: :controller do

    context 'create' do
        it 'works' do
            sign_in
            count = Core::Event.count
            event = build(:empty_event)
            location = create(:core_location)
            event_category = create(:core_event_category)
            post :create, params: {
                title: event.title,
                description: event.description,
                event_location: location,
                event_category: event_category
            }, format: :json
            puts(JSON.parse(response.body))

        end
    end

end
