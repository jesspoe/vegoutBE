class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.string :email
      t.integer :group_id

      t.timestamps
    end
  end
end
