require 'rails_helper'

RSpec.describe Core::LocationsController, type: :controller do
    context 'create' do
        it 'succeeds when signed in' do
            sign_in
            location = create(:core_location)
            address = location.address
            puts(address.country)
            post :create, params: {
                id: location.id,
                address_id: address.id,
                name: location.name, 
                description: location.description
            }
            puts(response.body)
            expect(response).to have_http_status(200)
        end
    end
    # context 'update' do
    #     it 'succeeds when signed in' do
    #         sign_in
    #         location = create(:core_location)
    #         address = location.address
    #         updated_address = "Updated Address"
    #         put :update, params: {id: location.id, name: 'New name', address_one: 'update'}, format: :json
    #         puts(response.body)
    #     end
    # end

end
