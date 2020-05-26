class AddFkToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :user_id, :integer, null: false
    add_foreign_key :posts, :users
  end
end
