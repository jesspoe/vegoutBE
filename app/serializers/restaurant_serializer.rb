class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :website, :veg_level_description, :address1, :city, :postal_code, :region, :neighborhood, :price_range, :cuisines, :phone, :long_description
  
  has_many :restaurant_groups
  has_many :groups, through: :restaurant_groups
end
