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
                event_event_category: [
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
                event_event_category: [
                    :name,
                    :description
                ]
            )
        end
end
