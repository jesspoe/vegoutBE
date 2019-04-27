class Group < ApplicationRecord
has_many :user_group
has_many :invite
has_many :restaurant_group 

 has_many :users, through: :user_group
 has_many :restaurants, through: :restaurant_group
end
