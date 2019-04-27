class RestaurantGroup < ApplicationRecord
  belongs_to :restaurants
  belongs_to :groups
end
