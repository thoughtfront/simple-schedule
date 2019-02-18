class Core::EventCategoriesController < ApplicationController

   

    def create
        category = Core::EventCategory.new(event_category_params)
        if category.save
            render json: {status: 'SUCCESS', message: 'Saved event category', data:category}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Event category not saved', data:category.errors}, status: :unprocessable_entity
        end
    end

    def index
        categories = Core::EventCategory.order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'Loaded event categories', data:categories}, status: :ok
    end

    def show
        category = Core::EventCategory.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded event category', data:category}, status: :ok
    end

    def update
        category = Core::EventCategory.find(params[:id])
        if category.update_attributes(event_category_params)
            render json: {status: 'SUCCESS', message: 'Update event category', data:category}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Event category not updated', data:category.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        category = Core::EventCategory.find(params[:id])
        if category.destroy
            render json: {status: 'SUCCESS', message: 'Destroyed event category', data:category}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Event category not destroyed', data:category.errors}, status: :unprocessable_entity
        end
    end

    private

        def event_category_params
            params.permit(:name, :description)
        end
end
