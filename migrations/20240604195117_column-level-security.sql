revoke
update
  on table public.todo
from
  authenticated;

grant
update
  (title, description, deadline) on table public.todo to authenticated;

revoke
insert
  on table public.todo
from
    authenticated;

grant
insert
  (title, description, deadline) on table public.todo to authenticated;