class SpicesController < ApplicationController
    def index
        render json: Spice.all
    end

    def show
        spice = Spice.find(params[:id])
        if spice
            render json: spice
        else
            render json: { error: "Spice not found" }, status: :not_found
        end
    end

    def create
        spice = Spice.create!(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find(params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: { error: "Spice not found" }, status: :not_found
        end
    end

    def destroy
        spice = Spice.find(params[:id])
        if spice
            spice.delete
            render json: {}
        else
            render json: { error: "Spice not found" }, status: :not_found
        end
    end

    private

    def spice_params
        params.permit(:id, :title, :description, :notes, :image, :rating)
    end
end
