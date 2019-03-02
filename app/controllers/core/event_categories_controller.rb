class Core::EventCategoriesController < ApplicationController
    # before_action :require_login
    
    def create
        category = Core::EventCategory.new(event_category_params)
        if category.save

            response.headers["Category Name: "] = "#{category.name}"
            response.headers["Category Description: "] = "#{category.description}"
            response.headers["Category Created at: "] = "#{category.created_at}"
            response.headers["Category Updated at: "] = "#{category.updated_at}"

            render json: {data:category}, status: :ok
        else
            render json: {data:category.errors}, status: :unprocessable_entity
        end
    end

    def index
        x = 1
        categories = Core::EventCategory.order('created_at DESC');
       
        categories.each do |category|
            response.headers["Category #{x} Name: "] = "#{category.name}"
            response.headers["Category #{x} Description: "] = "#{category.description}"
            response.headers["Category #{x} Created at: "] = "#{category.created_at}"
            response.headers["Category #{x} Updated at: "] = "#{category.updated_at}"
            x += 1
        end

        # response.headers['Categories'] = categories[1].name
        render json: {data:categories}, status: :ok
    end

    def show

        category = Core::EventCategory.find(params[:id])

        response.headers["Category Name: "] = "#{category.name}"
        response.headers["Category Description: "] = "#{category.description}"
        response.headers["Category Created at: "] = "#{category.created_at}"
        response.headers["Category Updated at: "] = "#{category.updated_at}"

        render json: {data:category}, status: :ok

    end

    def update
        category = Core::EventCategory.find(params[:id])

        if category.update_attributes(event_category_params)
            
            response.headers["Category Name: "] = "#{category.name}"
            response.headers["Category Description: "] = "#{category.description}"
            response.headers["Category Created at: "] = "#{category.created_at}"
            response.headers["Category Updated at: "] = "#{category.updated_at}"

            render json: {data:category}, status: :ok

        else
            render json: {status: 'ERROR', message: 'Event category not updated', data:category.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        category = Core::EventCategory.find(params[:id])
        if category.destroy
            response.headers["Category Name: "] = "#{category.name}"
            response.headers["Category Description: "] = "#{category.description}"
            response.headers["Category Created at: "] = "#{category.created_at}"
            response.headers["Category Updated at: "] = "#{category.updated_at}"

            render json: {data:category}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Event category not destroyed', data:category.errors}, status: :unprocessable_entity
        end
    end

    private

        def event_category_params
            params.permit(:name, :description)
        end
end
