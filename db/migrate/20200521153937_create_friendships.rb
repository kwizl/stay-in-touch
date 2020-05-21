class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end 
    add_reference :friendship, :friend, foreign_key: { to_table: :users }
  end
end
