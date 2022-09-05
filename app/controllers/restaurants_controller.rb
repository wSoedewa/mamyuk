class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @favorite = Favorite.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def confirmation
    @restaurant = Restaurant.find(params[:id])
  end
end
