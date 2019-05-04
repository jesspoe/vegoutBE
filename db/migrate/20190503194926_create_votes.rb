class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :group_id
      t.string :rest_name

      t.timestamps
    end
  end
end
