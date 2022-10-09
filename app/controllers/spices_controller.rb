class SpicesController < ApplicationController
#rescue_from ActionController::RoutingError, with: :no_routes

    # def show
    #     spice = Spice.find_by(id: params[:id])
    #     render json: spice
    # end

    def index
        spices = Spice.all
        render json: spices
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created 
    end

    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice, status: :accepted
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
    # def no_routes
    #     respond_to do |format|
    #         format.html { render json: { "does not have any unused routes" } }
    #     end
    # end
end
