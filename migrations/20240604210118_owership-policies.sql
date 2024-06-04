create policy "Todo - User is owner or admin - select restriction"
on "public"."todo"
as restrictive
for select
to authenticated
using (
  "userUuid" = auth.uid() OR
  user_has_role('admin')
);


create policy "Todo - User is owner or admin - update restriction"
on "public"."todo"
as restrictive
for update
to authenticated
using (
  "userUuid" = auth.uid() OR
  user_has_role('admin')
)
with check (
  "userUuid" = auth.uid() OR
  user_has_role('admin')
);


create policy "Todo - User is owner or admin - delete restriction"
on "public"."todo"
as restrictive
for delete
to authenticated
using (
  "userUuid" = auth.uid() OR
  user_has_role('admin')
);


create policy "User - User is owner or admin - select restriction"
on "public"."user"
as restrictive
for select
to authenticated
using (
  uuid = auth.uid() OR
  user_has_role('admin')
);


create policy "User - User is owner or admin - update restriction"
on "public"."user"
as restrictive
for update
to authenticated
using (
  uuid = auth.uid() OR
  user_has_role('admin')
)
with check (
  uuid = auth.uid() OR
  user_has_role('admin')
);


create policy "User - User is owner or admin - delete restriction"
on "public"."user"
as restrictive
for delete
to authenticated
using (
  uuid = auth.uid() OR
  user_has_role('admin')
);
