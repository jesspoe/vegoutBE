class LocationsController < ApplicationController

  def geo 
    puts "I am in geo"
    puts ENV["GOOGLE_KEY"]
    encodedAddress = params[:loc]
    url = URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{encodedAddress}&key=#{ENV["GOOGLE_KEY"]}")
    res = Net::HTTP.get_response(url)
    render plain: res.body
  end 

  def location 
    puts "I am in location"
    puts ENV["GOOGLE_KEY"]
    url = URI("https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV["GOOGLE_KEY"]}")
    res = Net::HTTP.get_response(url)
    render plain: res.body
end 

def city 
  puts "I am in city grlll"
  puts ENV["GOOGLE_KEY"]
  puts params
  lat = params[:lat]
  lng = params[:lng]
  url = URI("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{lat},#{lng}&key=#{ENV["GOOGLE_KEY"]}")
  res = Net::HTTP.get_response(url)
  render plain: res.body
end 



end 