class AddSeqAndTriggerToPosts < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE SEQUENCE comments_count_seq OWNED BY posts.comments_count;
          CREATE OR REPLACE FUNCTION public.trg_comments_count_fn()
            RETURNS trigger
            LANGUAGE 'plpgsql'
            COST 100
            VOLATILE NOT LEAKPROOF AS $BODY$
            BEGIN
              update posts
              set comments_count = nextval('comments_count_seq')
              where id = new.post_id;
              RETURN NEW;
            END
            $BODY$;

            CREATE TRIGGER trg_comments_count
            AFTER INSERT
            ON public.comments
            FOR EACH ROW
            EXECUTE PROCEDURE public.trg_comments_count_fn();
        SQL
      end
      dir.down do
        execute <<-SQL
          DROP SEQUENCE comments_count_seq;
          DROP TRIGGER trg_comments_count ON public.comments; 
          DROP FUNCTION public.trg_comments_count_fn(); 
        SQL
      end
    end
  end
end
