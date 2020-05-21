class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true, null: false
      t.string :status, "char(1)", null: false, default: 'p',
              inclusion: { in: ['a', 'r', 'p'], 
                          as: :trigger,
                          message: "can't be anything else than a, r, p" }

      t.timestamps
    end 
    add_reference :friendships, :friend, foreign_key: { to_table: :users }
  end
end
