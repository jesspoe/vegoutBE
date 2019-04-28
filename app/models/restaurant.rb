class Restaurant < ApplicationRecord
  has_many :restaurant_groups
  has_many :groups, through: :restaurant_groups
end
