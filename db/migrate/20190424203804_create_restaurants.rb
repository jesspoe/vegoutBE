class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :website
      t.string :veg_level_description
      t.string :address1
      t.string :city
      t.string :postal_code
      t.string :region
      t.string :neighborhood
      t.string :price_range
      t.string :cuisines
      t.string :phone
      t.string :long_description

      t.timestamps
    end
  end
end
