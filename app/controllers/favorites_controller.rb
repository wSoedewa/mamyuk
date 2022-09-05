class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def create
    @favorite = Favorite.new(params[:restaurant_id])
    if @favorite.save
      flash[:notice] = "Saved to Favorites."
    else
      flash[:alert] = "Error."
    end
  end

  def update
  end

  def destroy
    @favorite = Favorite.find(params(:id))
    @favorite.destroy
  end
end
