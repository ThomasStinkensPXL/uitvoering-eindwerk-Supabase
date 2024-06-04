create policy "Todo create permission"
on "public"."todo"
as permissive
for insert
to authenticated
with check (( SELECT authorize('todo.create'::app_permission) AS authorize));


create policy "Todo delete permission"
on "public"."todo"
as permissive
for delete
to authenticated
using (( SELECT authorize('todo.delete'::app_permission) AS authorize));


create policy "Todo read permission"
on "public"."todo"
as permissive
for select
to authenticated
using (( SELECT authorize('todo.read'::app_permission) AS authorize));


create policy "Todo update permission"
on "public"."todo"
as permissive
for update
to authenticated
using (( SELECT authorize('todo.update'::app_permission) AS authorize))
with check (( SELECT authorize('todo.update'::app_permission) AS authorize));


create policy "User create permission"
on "public"."user"
as permissive
for insert
to authenticated
with check (( SELECT authorize('user.create'::app_permission) AS authorize));


create policy "User delete permission"
on "public"."user"
as permissive
for delete
to authenticated
using (( SELECT authorize('user.delete'::app_permission) AS authorize));


create policy "User read permission"
on "public"."user"
as permissive
for select
to authenticated
using (( SELECT authorize('user.read'::app_permission) AS authorize));


create policy "User update permission"
on "public"."user"
as permissive
for update
to authenticated
using (( SELECT authorize('user.update'::app_permission) AS authorize))
with check (( SELECT authorize('user.update'::app_permission) AS authorize));