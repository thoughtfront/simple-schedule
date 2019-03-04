class Core::LocationsController < ApplicationController
    # before_action :require_login
    
    def create
        category = Core::Location.new(location_params)
        if location.save
            render json: {data:location}, status: :ok
        else
            render json: {data:location.errors}, status: :unprocessable_entity
        end
    end

    def index
        locations = Core::Location.order('created_at DESC')
        render json: {data:locations}, status: :ok
    end

    private

        def location_params
            params.permit(:name, :descripition)
        end
    
end
