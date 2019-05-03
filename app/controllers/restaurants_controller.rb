class RestaurantsController < ApplicationController
  skip_before_action :authorized, only: [:api, :index]

  def index 
    @restaurants = Restaurant.all 
    render json: @restaurants 
  end 
  
  
  def api
     response = HTTParty.get('https://www.vegguide.org/search/by-lat-long/47.661436099999996,-122.34487650000001/filter/category_id=1;veg_level=2;/?limit=45')
     json = JSON.parse(response.body) 
     @restaurants = json['entries']
     render json: @restaurants
  end

  def search 
    response = HTTParty.get("https://www.vegguide.org/search/by-address/'#{params[:citySearch]}'/filter/category_id=1;veg_level=2;/?limit=45")
    json = JSON.parse(response.body)
    @restaurants = json['entries']
    render json: @restaurants
  end 

  def initial 
    response = HTTParty.get("https://www.vegguide.org/search/by-address/'#{params[:currentCity]}'/filter/category_id=1;veg_level=2;/?limit=45")
    json = JSON.parse(response.body)
    @restaurants = json['entries']
    render json: @restaurants
  end 

def create 
  @restaurant = Restaurant.new(restaurant_params)
  @restaurant.save
  @restaurantgroup = RestaurantGroup.create(group_id: params[:group_id], restaurant_id: @restaurant.id )
  render json: {restaurant: @restaurant, restaurantgroup: @restaurantgroup}
end 


def restaurant_params
  params.require(:restaurant).permit(:name, :website, :veg_level_description, :address1, :city, :postal_code, :region, :neighborhood, :price_range, :cuisines, :phone, :short_description)
end
  
end
