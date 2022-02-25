class Api::V1::HousesController < ApplicationController
  before_action :set_houses, only: %i[destroy show]

  def index
    @houses = current_user.houses.all
  end

  def create
    @house = current_user.houses.new(house_params)

    if @house.save!
      render :create, status: :created
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @house.destroy
      render json: { message: 'house has been successfully deleted' }
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:name, :rooms, :beds, :baths, :price, :rating, :image_url, :description)
  end
end
