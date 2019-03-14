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
                end
            else
                render json: address.errors, status: :unprocessable_entity   
            end
        end
    end

    def index
        locations = Core::Location.order('created_at DESC').includes(:address).map { |location| location.attributes }
        render json: locations, status: :ok
    end

    def show
        location = Core::Location.find(params[:id])
        render json: location, status: :ok
    end

    def update
        location = Core::Location.includes(:address).find(params[:id])
        if location.address_id == nil
            if location.update(location_params)
                render json: location, status: :ok
            else
                render json: location.errors
            end 
        else
            if location.address.update(location_address_params)
                if location.update(location_params)
                    render json: location, status: :ok
                end 
            else
                render json: location.address.errors
            end
        end   
    end

    private

        def location_params
            params.permit(
                :name, 
                :description, 
                location_address: [:id, :address_one, :address_two, :city, :state_region, :country, :postal_code, :label])
        end

        def location_address_params
            params.permit(
                :address_one, 
                :address_two, 
                :city, 
                :state_region, 
                :country, 
                :postal_code, 
                :label
            )
        end
end
