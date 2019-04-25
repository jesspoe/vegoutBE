class Group < ApplicationRecord
 belongs_to :user_group
 belongs_to :invite
 belongs_to :restaurant_group 

 has_many :users, through: :user_group
 has_many :restaurants, through: :restaurant_group
end
