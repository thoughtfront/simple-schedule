class Core::LocationsController < ApplicationController
    # before_action :require_login
    
    def create
        # Must create and address from params and pass the address_id into the location object
        location = Core::Location.new(location_params)
        if location.save
            render json: location, :include => {:address => {:except => :id}}, status: :ok
        else
            render json: location.errors, status: :unprocessable_entity
        end
    end

    def index
        locations = Core::Location.order('created_at DESC')
        render json: locations, :include => {:address => {:except => :id}}, status: :ok
    end

    def show
        location = Core::Location.find(params[:id])
        render json: location, :include => {:address => {:except => :id}}, status: :ok
    end

    def update
        # Use location's address_id to update associated address along with updating location
        location = Core::Location.find(params[:id])
        puts(location_params)
        if location.update_attributes(location_params)
            render json: location, :include => {:address => {:except => :id}}, status: :ok
        end  
    end

    private

        def location_params
            params.permit(:name, :description, :address_id,)
        end
    
end
