require 'rails_helper'
require 'clearance/rspec'


RSpec.describe Core::EventCategoriesController, type: :controller do
    include Clearance::Controller    

    context 'create' do
        
        it 'succeeds' do
           sign_in current_user
           current = Core::EventCategory.count
           puts(current)
        end   
    end


end
