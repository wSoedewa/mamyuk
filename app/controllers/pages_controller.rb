class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def search
    @client = GooglePlaces::Client.new(ENV.fetch('GOOGLE_MAPS_KEY'))
    @restaurants = []
    restaurants = @client.spots(-8.4546925, 114.7913926, name: params[:cuisine], types: ['restaurant', 'food'], detail: true)
    restaurants.each do |r|
      # raise
      resto = Restaurant.new(
        name: r.name,
        price: r.price_level,
        rating: r.rating,
        location: r.formatted_address,
        cuisine: params[:cuisine],
        phone_number: r.formatted_phone_number
      )
      unless resto.save
        resto = Restaurant.find_by(name: r.name, location: r.formatted_address)
      end
      @restaurants << resto if @restaurants.length < 3 && resto
    end
    # @restaurants = Restaurant.limit(3)
  end

  def components
  end

  def search_1
  end

  def search_2
    session[:category_chosen] = params[:category_chosen]
  end
# Need to include all budget below the one selected
  def search_3
    session[:budget_chosen] = params[:budget_chosen]
  end
# Need to include distance between 0km and distance selected
  def loading_results
    session[:distance] = params[:distance]
  end
end
