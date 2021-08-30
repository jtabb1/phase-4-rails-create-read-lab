# Apply error message advice in a command line command
#   to make app work. (Unrelated to this file but documented 
#   so that readers know that this app actually works.

class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  # other controller actions here

  private

  def plant_params
    params.permit(:name, :image, :price)
  end

end
