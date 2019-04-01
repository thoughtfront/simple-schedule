class Core::EventsController < ApplicationController
    before_action :require_login

    def create
        event = Core::Event.new(event_params)
        
        if event.save
            render json: event, status: :ok
        else
            render json: event.errors, status: :unprocessable_entity
        end
    end

    def index
        events = Core::Event.order('created_at DESC').includes(:location,:event_category)
        render json: events, status: :ok
    end

    def show
        event = Core::Event.find(params[:id])
        render json: event, status: :ok
    end

    def update
        event = Core::Event.includes(:event_category).find(params[:id])
        if event_category_id != nil
            if event_location_id != nil
                # Do location branch update through model first
        
            if event.update(event_params)
                render json: event, status: :ok
            else
                render json: event.errors
            end
        else
            if event.location.update(event_location_params)
    end

    private

        def event_params
            params.permit(
                :title,
                :description,
                event_location: [
                    :name,
                    :description,
                    location_address: [:id, :address_one, :address_two, :city, :state_region, :country, :postal_code, :label]
                ],
                event_event_category: [
                    :name,
                    :description
                ]
            )
        end

        def event_location_params
            params.permit(
                    :name,
                    :description,
                    location_address: [:id, :address_one, :address_two, :city, :state_region, :country, :postal_code, :label]
            )
        end

        def event_category_params
            params.permit(
                    :name,
                    :description
            )
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
