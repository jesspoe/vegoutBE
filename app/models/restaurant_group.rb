class RestaurantGroup < ApplicationRecord
  has_many :restaurants
  has_many :groups
end
