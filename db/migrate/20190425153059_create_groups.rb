class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.datetime :date 
      t.timestamps
    end
  end
end
