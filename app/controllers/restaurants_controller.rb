class RestaurantsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index 
     response = HTTParty.get('https://www.vegguide.org/search/by-lat-long/47.661436099999996,-122.34487650000001/filter/category_id=1;veg_level=2;/?limit=15')
     json = JSON.parse(response.body) 
     @restaurants = json['entries']
     render json: @restaurants
  end

  def search 
    response = HTTParty.get("https://www.vegguide.org/search/by-address/'#{params[:citySearch]}'/filter/category_id=1;veg_level=2;/?limit=25")
    json = JSON.parse(response.body)
    @restaurants = json['entries']
    render json: @restaurants
  end 

  def initial 
    response = HTTParty.get("https://www.vegguide.org/search/by-address/'#{params[:currentCity]}'/filter/category_id=1;veg_level=2;/?limit=25")
    json = JSON.parse(response.body)
    @restaurants = json['entries']
    render json: @restaurants
  end 
  
end
