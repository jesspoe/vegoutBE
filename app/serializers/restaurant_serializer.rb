class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :website, :distance, :veg_level_description, :string, :long_description, :address1, :city, :postal_code, :country, :neighborhood, :price_range, :categories, :cuisines, :phone, :short_description
end
