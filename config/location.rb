class LocationContoller < ApplicationController

  def location 
    puts ENV["GOOGLE_KEY"]
  end 

end 