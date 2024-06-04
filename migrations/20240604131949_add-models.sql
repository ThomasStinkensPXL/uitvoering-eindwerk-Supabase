create table "public"."Todo" (
    "uuid" uuid not null default gen_random_uuid(),
    "userUuid" uuid not null default auth.uid(),
    "title" character varying,
    "description" character varying,
    "deadline" timestamp with time zone,
    "isCompleted" boolean default false,
    "completedAt" timestamp with time zone
);


alter table "public"."Todo" enable row level security;

create table "public"."User" (
    "uuid" uuid not null default gen_random_uuid(),
    "email" character varying,
    "firstName" character varying,
    "lastName" character varying,
    "lastCompletionDate" character varying
);


alter table "public"."User" enable row level security;

CREATE UNIQUE INDEX "Todo_pkey" ON public."Todo" USING btree (uuid);

CREATE UNIQUE INDEX "User_pkey" ON public."User" USING btree (uuid);

alter table "public"."Todo" add constraint "Todo_pkey" PRIMARY KEY using index "Todo_pkey";

alter table "public"."User" add constraint "User_pkey" PRIMARY KEY using index "User_pkey";

grant delete on table "public"."Todo" to "anon";

grant insert on table "public"."Todo" to "anon";

grant references on table "public"."Todo" to "anon";

grant select on table "public"."Todo" to "anon";

grant trigger on table "public"."Todo" to "anon";

grant truncate on table "public"."Todo" to "anon";

grant update on table "public"."Todo" to "anon";

grant delete on table "public"."Todo" to "authenticated";

grant insert on table "public"."Todo" to "authenticated";

grant references on table "public"."Todo" to "authenticated";

grant select on table "public"."Todo" to "authenticated";

grant trigger on table "public"."Todo" to "authenticated";

grant truncate on table "public"."Todo" to "authenticated";

grant update on table "public"."Todo" to "authenticated";

grant delete on table "public"."Todo" to "service_role";

grant insert on table "public"."Todo" to "service_role";

grant references on table "public"."Todo" to "service_role";

grant select on table "public"."Todo" to "service_role";

grant trigger on table "public"."Todo" to "service_role";

grant truncate on table "public"."Todo" to "service_role";

grant update on table "public"."Todo" to "service_role";

grant delete on table "public"."User" to "anon";

grant insert on table "public"."User" to "anon";

grant references on table "public"."User" to "anon";

grant select on table "public"."User" to "anon";

grant trigger on table "public"."User" to "anon";

grant truncate on table "public"."User" to "anon";

grant update on table "public"."User" to "anon";

grant delete on table "public"."User" to "authenticated";

grant insert on table "public"."User" to "authenticated";

grant references on table "public"."User" to "authenticated";

grant select on table "public"."User" to "authenticated";

grant trigger on table "public"."User" to "authenticated";

grant truncate on table "public"."User" to "authenticated";

grant update on table "public"."User" to "authenticated";

grant delete on table "public"."User" to "service_role";

grant insert on table "public"."User" to "service_role";

grant references on table "public"."User" to "service_role";

grant select on table "public"."User" to "service_role";

grant trigger on table "public"."User" to "service_role";

grant truncate on table "public"."User" to "service_role";

grant update on table "public"."User" to "service_role";