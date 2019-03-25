class Core::EventsController < ApplicationController
    before_action :require_login

    def create
        location = Core::location.new(event_params["event_location"])
        event_category = Core::EventCategory.new(event_params["event_category"])
        event = Core::Event.new(event_params)

        if location != nil
            if location.save
                event.location_id = location.id 
            else
                render json: location.errors, status: :unprocessable_entity
                return
            end 
        end

        if event_category != nil
            if event_category.save
                event.event_category_id = event_category.id
            else
                render json: event_category.errors, status: :unprocessable_entity
                return
            end
        end

        if event.save
            render json: event, status: :ok
        else
            render json: event.errors, status: :unprocessable_entity
        end
    end

    private

        def event_params
            params.permit(
                :title,
                :description,
                event_location: [
                    :name,
                    :description,
                    location_address: [
                        :id,
                        :address_one,
                        :address_two,
                        :city,
                        :state_region,
                        :country,
                        :postal_code,
                        :label
                    ]
                ],
                event_cateogry: [
                    :name,
                    :description
                ]
            )
        end

        def event_location_params
            params.permit(
                event_location: [
                    :name,
                    :description
                ]
            )
        end

        def event_category_params
            params.permit(
                event_category: [
                    :name,
                    :description
                ]
            )
        end
end
