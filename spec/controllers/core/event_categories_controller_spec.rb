require 'rails_helper'
require 'clearance/rspec'


RSpec.describe Core::EventCategoriesController, type: :controller do   

    context 'create' do

        it 'has route connected to controller' do
            expect(:post => "/core/event_categories").to route_to(:controller => "core/event_categories", :action => "create")
        end
        
        it 'succeeds when signed in' do
            sign_in
            count = Core::EventCategory.count
            category = build(:core_event_category)
            post :create, params: {name: category.name, description: category.description}, format: :json
            expect(response).to have_http_status(200)#Ok
            expect(Core::EventCategory.count).to eq(count + 1) 
        end   

        it 'errors when not signed in' do
            post :create, format: :json
            expect(response).to have_http_status(401)#Unauthorized
        end

        it 'errors when event_category object has no data' do
            sign_in
            post :create
            expect(response).to have_http_status(422)#Unprocessable Entity
        end  
    end

    context 'index' do
        # Need to test that the data that we asked for was actually reveived as opposed to checking the the count was updated.
        it 'has route connected to controller' do
            expect("get" => "core/event_categories").to route_to(:controller => "core/event_categories", :action => "index")
        end

        it 'succeeds when signed in' do
            sign_in
            create(:core_event_category)
            create(:core_event_category)
            get :index, format: :json
            category_index = JSON.parse(response.body)
            expect(category_index.size).to eq(2)
            expect(response).to have_http_status(200)
        end

        it 'errors when not signed in' do
            get :index, format: :json
            expect(response).to have_http_status(401)
        end
    end

    context 'show' do

        it 'has route connected to controller' do
            expect("get" => "core/event_categories/1").to route_to(:controller => "core/event_categories", :action => "show", :id => "1")
        end

        it 'succeeds when signed in' do
            sign_in
            category = create(:core_event_category)
            get :show, params: {id: category.id}
            expect(response).to have_http_status(200)
            expect(JSON.parse(response.body)['id']).to eq(category.id)
        end

        it 'should match created category' do
            sign_in
            category = create(:core_event_category)
            get :show, params: {id: category.id}, format: :json
            retreived_category = JSON.parse(response.body)
            expect(retreived_category['id']).to eq(category.id)
        end

        it 'errors when not signed in' do
            get :show, params: {id: "1"}, format: :json
            expect(response).to have_http_status(401)  
        end
    end

    context 'update' do

        it 'has route connected to controller' do
            expect("put" => "core/event_categories/1").to route_to(:controller => "core/event_categories", :action => "update", :id => "1")
        end

        it 'succeeds when signed in' do
            sign_in
            category = create(:core_event_category)
            updated_description = "Updated Description"
            put :update, params: {id: category.id, description: updated_description}, format: :json
            updated_category = JSON(response.body)
            description = updated_category['description']
            expect(description).to eq(updated_description)

        end

        it 'errors when not signed in' do
            put :update, params: {id: "1"}, format: :json
            expect(response).to have_http_status(401)
        end

        it 'prevents invalid updates' do
            sign_in
            category = create(:core_event_category)
            put :update, params: {id: category.id, name: nil}, format: :json
            expect(response).to have_http_status(422)
        end
    end

    context 'destroy' do
        
        it 'has route connected to controller' do
            expect("delete" => "core/event_categories/1").to route_to(:controller => "core/event_categories", :action => "destroy", :id => "1")
        end

        it 'succeeds when signed in' do
            sign_in
            category = create(:core_event_category)
            delete :destroy, params: {id:category.id}, format: :json
            deleted_category = JSON(response.body)
            id = deleted_category["id"]
            expect(response).to have_http_status(200)
            expect(id).to eq(category.id)
        end

        it 'errors when not signed in' do
            delete :destroy, params: {id: "1"}, format: :json
            expect(response).to have_http_status(401)
        end
    end
end