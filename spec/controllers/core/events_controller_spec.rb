require 'rails_helper'

RSpec.describe Core::EventsController, type: :controller do

    context 'create' do

        it 'has route connected to cotroller' do
            expect(:post => "core/events").to route_to(:controller => "core/events", :action => "create")
        end

        it 'succeeds when signed in' do
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
            expect(response).to have_http_status(200)
            expect(Core::Event.count).to eq(count + 1)
        end

        it 'errors when not signed in' do
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
            expect(response).to have_http_status(401)
        end

        it 'errors when event has no title' do
            sign_in
            event = build(:event, title: nil)
            event_category = build(:core_event_category)
            post :create, params: {
                title: event.title,
                description: event.description,
                event_event_category: {
                    name: event_category.name,
                    description: event_category.description
                }
            }, format: :json
            expect(response).to have_http_status(422)
        end

        it 'errors when event object is empty' do
            sign_in
            post :create, format: :json
            expect(response).to have_http_status(422)
        end
 
    end

end
