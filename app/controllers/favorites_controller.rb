class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def update
  end

  def destroy
    @favorite = Favorite.find(params(:id))
    @favorite.destroy
  end
end
