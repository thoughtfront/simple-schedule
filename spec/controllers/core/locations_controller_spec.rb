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
            create(:location, :address => create(:address))
            create(:location, :address => create(:address))
            get :index, format: :json
            location_index = JSON.parse(response.body)
            expect(location_index.size).to eq(2)
            expect(response).to have_http_status(200)
        end

        it 'errors when not signed in' do
            create(:location, :address => create(:address))
            create(:location, :address => create(:address))
            get :index, format: :json
            expect(response).to have_http_status(401)
        end
    end

    context 'show' do
        it 'has route connected to controller' do
            expect("get" => "core/locations/1").to route_to(:controller => "core/locations", :action => "show", :id => "1")
        end
        
    end

end
