class AddTriggerToFriendships < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
        CREATE OR REPLACE FUNCTION public.trg_friendships_fn()
          RETURNS trigger
          LANGUAGE 'plpgsql'
          COST 100
          VOLATILE NOT LEAKPROOF
          AS $BODY$
          begin
            insert into friendships (user_id, friend_id, status, created_at, updated_at)
              VALUES (new.friend_id, new.user_id, 'a', current_timestamp, current_timestamp);
            RETURN NEW;
          end;
          $BODY$;

        CREATE TRIGGER trg_friendship
            AFTER UPDATE OF status
            ON public.friendships
            FOR EACH ROW
          WHEN (OLD.status = 'p' AND NEW.status = 'a')
            EXECUTE PROCEDURE public.trg_friendships_fn();
        SQL
      end
      dir.down do
        execute <<-SQL
          DROP TRIGGER trg_friendship ON public.friendships;
          DROP FUNCTION public.trg_friendships_fn();
        SQL
      end
    end
  end
end
