require 'rails_helper'

RSpec.describe Core::LocationsController, type: :controller do
    context 'create' do
        it 'succeeds when signed in' do
            sign_in
            location_count = Core::Location.count
            location = build(:location_without_address)
            address = build(:address)
            post :create, params: {
                id: location.id,
                name: location.name, 
                description: location.description,
                location_address: {
                    address_one: address.address_one,
                    address_two: address.address_two,
                    city: address.city,
                    state_region: address.state_region,
                    country: address.country,
                    postal_code: address.postal_code,
                    label: address.label
                }    
            }
            puts(response.body)
            expect(response).to have_http_status(200)
            expect(Core::Location.count).to eq(location_count + 1)
        end
    end
end
