class Api::V1::CategoriesController < actionController::API
    def index
        categories = category.all 
        render json: {message: 'OK', categories: categories.as_json(only: [:id, :name, :created_at, :disabled_at])}.to_json, status: 200
    end 
    def show
        categories = category.find(params[:id])
        if category 
            render json: { message: 'OK', category: category }.to_json, status: 200
        else
            render json: { message: 'Error', error: 'category not found with the given id' }.to_json, status: 404
        end
    rescue => e
        render json: { message: 'Error', error: e.message }.to_json, status: 500
    end
end