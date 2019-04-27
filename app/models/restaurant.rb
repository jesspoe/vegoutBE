class Restaurant < ApplicationRecord
  has_many :restaurant_group
  has_many :groups, through: :restaurant_group
end
