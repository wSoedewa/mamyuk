class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.new(restaurant: @restaurant, user_id: current_user.id)
    if @booking.save!
      redirect_to confirmation_path(id: @restaurant.id)
    else
      render :new
    end
  end
end
