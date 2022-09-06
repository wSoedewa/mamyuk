class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @favorite = Favorite.new(favorite_params)
    @favorite.restaurant = @restaurant
    if @favorite.save
      flash[:notice] = "Saved!"
      redirect_to restaurants_path
    else
      flash[:alert] = "[Error] Did not save."
    end
  end

  def update
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
  end

  private

  def favorite_params
    params.require(:favorite).permit(:list_id)
  end
end
