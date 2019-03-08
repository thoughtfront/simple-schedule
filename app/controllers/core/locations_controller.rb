class Core::LocationsController < ApplicationController
    before_action :require_login
    
    def create
        # Create address instance
        address = Core::Address.new(location_params["location_address"])
        location = Core::Location.new(location_params)
        if address != nil  
            if address.save
                location.address_id = address.id   
                if location.save
                    render json: location, status: :ok
                else
                    render json: location.errors, status: :unprocessable_entity
                    puts(location.errors)
                end
            else
                render json: address.errors, status: :unprocessable_entity   
            end
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
            params.permit(
                :name, 
                :description, 
                location_address: [:address_one, :city, :state_region, :country, :postal_code])
        end
end
