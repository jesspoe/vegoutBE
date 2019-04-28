class Group < ApplicationRecord
has_many :user_groups
has_many :invites
has_many :restaurant_groups

 has_many :users, through: :user_group
 has_many :restaurants, through: :restaurant_group
end
