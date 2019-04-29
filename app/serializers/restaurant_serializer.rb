class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :website, :distance, :veg_level_description, :address1, :city, :postal_code, :region, :neighborhood, :price_range, :cuisines, :phone, :short_description
  
  has_many :restaurant_groups
  has_many :groups, through: :restaurant_groups
end
