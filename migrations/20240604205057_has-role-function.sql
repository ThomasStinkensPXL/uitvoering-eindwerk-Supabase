create or replace function public.user_has_role(
  requested_role app_role
)
returns boolean as $$
declare
  user_roles_matched int;
begin
    select count(*)
    into user_roles_matched
    from public.user_roles
    where user_roles.user_uuid = (auth.jwt() ->> 'id')::uuid
      and user_roles.role = requested_role;

    return user_roles_matched > 0;
    end;
$$ language plpgsql stable security definer set search_path = '';