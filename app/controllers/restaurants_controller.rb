class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.geocoded.near([-8.65417, 115.1306762], session[:distance]).where("name ILIKE ? or cuisine ILIKE ? and price <= ?",  "%#{session[:category_chosen]}%", "%#{session[:category_chosen]}%", session[:budget_chosen].length).order(rating: :desc)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def confirmation
  end
end
