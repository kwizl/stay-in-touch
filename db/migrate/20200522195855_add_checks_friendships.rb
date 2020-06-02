class AddChecksFriendships < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE friendships
            ADD CONSTRAINT status_chk
              CHECK (status IN ('a', 'p', 'c'));
          ALTER TABLE friendships
              ADD CONSTRAINT friend_chk
                CHECK (user_id <> friend_id);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE friendships
            DROP CONSTRAINT status_chk;
          ALTER TABLE friendships
            DROP CONSTRAINT friend_chk;
        SQL
      end
    end
    remove_column :friendships, "char(1)", :string
  end
end
