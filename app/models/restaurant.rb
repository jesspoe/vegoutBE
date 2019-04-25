class Restaurant < ApplicationRecord
  belongs_to :restaurant_group
  has_many :groups, through: :restaurant_group
end
