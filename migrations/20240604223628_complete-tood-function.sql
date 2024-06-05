alter table "public"."user"
alter column "lastCompletionDate" type timestamp with time zone
using "lastCompletionDate"::timestamptz;

create or replace function public.complete_todo(
  todo_uuid uuid
)
returns void as $$
declare
  found_todo public.todo;
  completion_date_time timestamptz;
begin
    completion_date_time:= now();

    select *
    into found_todo
    from public.todo
    where todo.uuid = todo_uuid;

    if found_todo is null then
        raise exception 'No todo with uuid % found for authenticated user.', todo_uuid;
    end if;

    if found_todo."isCompleted" then
        raise exception 'The todo is already completed';
    end if;

    -- Limitten van ussage van de function (zodat niet random iemand de function can callen via de API)

    update public.todo
    set "isCompleted" = true, "completedAt" = completion_date_time
    where uuid = todo_uuid;

    update public.user
    set "lastCompletionDate" = completion_date_time
    where uuid = found_todo."userUuid";

    end;
$$ language plpgsql volatile security invoker set search_path = '';