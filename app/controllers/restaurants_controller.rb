class RestaurantsController < ApplicationController
  def index
    query = <<~SQL
    (name ILIKE ? or cuisine ILIKE ?) AND
    (price <= ? or price is null)
    SQL
    @restaurants = Restaurant
                   .geocoded
                   .near([-8.65417, 115.1306762], session[:distance])
                   .where(query,  "%#{session[:category_chosen]}%", "%#{session[:category_chosen]}%", session[:budget_chosen].length)
                   .order(rating: :desc)
                   .limit(3)
    @favorite = Favorite.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @markers = [
      {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude
      }
    ]
  end

  def confirmation
    @restaurant = Restaurant.find(params[:id])
  end
end
