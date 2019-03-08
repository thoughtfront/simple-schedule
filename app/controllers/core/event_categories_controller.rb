class Core::EventCategoriesController < ApplicationController
    before_action :require_login
    
    def create
        category = Core::EventCategory.new(event_category_params)
        if category.save
            render json: category, status: :ok
        else
            render json: category.errors, status: :unprocessable_entity
        end
    end

    def index
        categories = Core::EventCategory.order('created_at DESC');
        render json: categories, status: :ok
    end

    def show
        category = Core::EventCategory.find(params[:id])
        render json: category, status: :ok
    end

    def update
        category = Core::EventCategory.find(params[:id])
        if category.update_attributes(event_category_params)
            render json: category, status: :ok
        else
            render json: category.errors, status: :unprocessable_entity
        end
    end

    def destroy
        category = Core::EventCategory.find(params[:id])
        if category.destroy
            render json: category, status: :ok
        else
            render json: category.errors, status: :unprocessable_entity
        end
    end

    private

        def event_category_params
            params.permit(:name, :description)
        end
end
