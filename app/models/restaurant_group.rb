class RestaurantGroup < ApplicationRecord
  belongs_to :restaurant
  belongs_to :group
end
