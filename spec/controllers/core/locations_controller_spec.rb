require 'rails_helper'

RSpec.describe Core::LocationsController, type: :controller do
    context 'create' do

        it 'has route connected to controller' do
            expect(:post => "core/locations").to route_to(:controller => "core/locations", :action => "create")
        end

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
            }, format: :json
            expect(response).to have_http_status(200)
            expect(Core::Location.count).to eq(location_count + 1)
        end

        it 'errors when not signed in' do
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
            }, format: :json
            expect(response).to have_http_status(401)
        end

        it 'errors when location_address is empty' do
            sign_in
            location_count = Core::Location.count
            location = build(:location_without_address)
            post :create, params: {
                id: location.id,
                name: location.name, 
                description: location.description,
                location_address: {}    
            }, format: :json
            expect(response).to have_http_status(422)
            expect(Core::Location.count).to eq(location_count)
        end

        it 'errors when address is empty' do 
            sign_in
            location_count = Core::Location.count
            location = build(:location_without_address)
            address = build(:empty_address)
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
            }, format: :json
            expect(response).to have_http_status(422)
            expect(Core::Location.count).to eq(location_count)
        end

        it 'errors when location object has no data' do
            sign_in
            post :create, format: :json
            expect(response).to have_http_status(422)
        end
    end

    context 'index' do

        it 'has route connected to controller' do
            expect("get" => "core/locations").to route_to(:controller => "core/locations", :action => "index")
        end

        it 'succeeds when signed in' do
            sign_in
            create(:location)
            create(:location)
            get :index, format: :json
            location_index = JSON.parse(response.body)
            expect(location_index.size).to eq(2)
            expect(response).to have_http_status(200)
        end

        it 'errors when not signed in' do
            create(:location)
            create(:location)
            get :index, format: :json
            expect(response).to have_http_status(401)
        end
    end

    context 'show' do
        it 'has route connected to controller' do
            expect("get" => "core/locations/1").to route_to(:controller => "core/locations", :action => "show", :id => "1")
        end

        it 'succeeds when signed in' do
            sign_in
            location = create(:location)
            get :show, params: {id: location.id}, format: :json
            expect(JSON.parse(response.body)['id']).to eq(location.id)
            expect(response).to have_http_status(200)
        end

        it 'errors when not signed in' do
            location = create(:location, :address => create(:address))
            get :show, params: {id: location.id}, format: :json
            expect(response).to have_http_status(401)
        end
    end

    context 'update' do
        it 'has route connected to controller' do
            expect("put" => "core/locations/1").to route_to(:controller => "core/locations", :action => "update", :id => "1")
        end

        it 'succeeds when signed in' do
            sign_in
            location = create(:location, :address => create(:address))
            update_name = 'updated name'
            put :update, params: {id: location.id, name: update_name}, format: :json
        end

        it 'succeeds when address is updated' do
            sign_in
            location = create(:location, :address => create(:address))
            count = Core::Address.count
            update_params = {id: location.id, :location_address => {
                address_one: 'updated address',
                address_two: location.address.address_two,
                city: location.address.city,
                state_region: location.address.state_region,
                country: location.address.country,
                postal_code: location.address.postal_code,
                label: location.address.label
                }}
            put :update, params: update_params, format: :json
            expect(count).to eq(Core::Address.count)
            expect(response).to have_http_status(200)
            puts(JSON.parse(response.body))
        end
    end

end
