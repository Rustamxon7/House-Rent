class Api::V1::FavoritesController < ApplicationController
  before_action :set_favorite, only: :destroy

  def index
    @favorites = current_user.favorites
  end

  def create
    @favorite = current_user.favorites.new(favorite_params)

    if @favorite.save
      render :create, status: :created
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @favorite.destroy
      render json: { message: 'Favorite has been successfully deleted' }
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end
end