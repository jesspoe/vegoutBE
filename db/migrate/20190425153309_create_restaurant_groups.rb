class CreateRestaurantGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_groups do |t|
      t.integer :group_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
