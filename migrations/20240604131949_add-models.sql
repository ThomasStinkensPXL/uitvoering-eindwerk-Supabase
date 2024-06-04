create table "public"."todo" (
    "uuid" uuid not null default gen_random_uuid(),
    "userUuid" uuid not null default auth.uid(),
    "title" character varying,
    "description" character varying,
    "deadline" timestamp with time zone,
    "isCompleted" boolean default false,
    "completedAt" timestamp with time zone
);


alter table "public"."todo" enable row level security;

create table "public"."user" (
    "uuid" uuid not null default gen_random_uuid(),
    "email" character varying,
    "firstName" character varying,
    "lastName" character varying,
    "lastCompletionDate" character varying
);


alter table "public"."user" enable row level security;

CREATE UNIQUE INDEX "todo_pkey" ON public."todo" USING btree (uuid);

CREATE UNIQUE INDEX "user_pkey" ON public."user" USING btree (uuid);

alter table "public"."todo" add constraint "todo_pkey" PRIMARY KEY using index "todo_pkey";

alter table "public"."user" add constraint "user_pkey" PRIMARY KEY using index "user_pkey";

grant delete on table "public"."todo" to "anon";

grant insert on table "public"."todo" to "anon";

grant references on table "public"."todo" to "anon";

grant select on table "public"."todo" to "anon";

grant trigger on table "public"."todo" to "anon";

grant truncate on table "public"."todo" to "anon";

grant update on table "public"."todo" to "anon";

grant delete on table "public"."todo" to "authenticated";

grant insert on table "public"."todo" to "authenticated";

grant references on table "public"."todo" to "authenticated";

grant select on table "public"."todo" to "authenticated";

grant trigger on table "public"."todo" to "authenticated";

grant truncate on table "public"."todo" to "authenticated";

grant update on table "public"."todo" to "authenticated";

grant delete on table "public"."todo" to "service_role";

grant insert on table "public"."todo" to "service_role";

grant references on table "public"."todo" to "service_role";

grant select on table "public"."todo" to "service_role";

grant trigger on table "public"."todo" to "service_role";

grant truncate on table "public"."todo" to "service_role";

grant update on table "public"."todo" to "service_role";

grant delete on table "public"."user" to "anon";

grant insert on table "public"."user" to "anon";

grant references on table "public"."user" to "anon";

grant select on table "public"."user" to "anon";

grant trigger on table "public"."user" to "anon";

grant truncate on table "public"."user" to "anon";

grant update on table "public"."user" to "anon";

grant delete on table "public"."user" to "authenticated";

grant insert on table "public"."user" to "authenticated";

grant references on table "public"."user" to "authenticated";

grant select on table "public"."user" to "authenticated";

grant trigger on table "public"."user" to "authenticated";

grant truncate on table "public"."user" to "authenticated";

grant update on table "public"."user" to "authenticated";

grant delete on table "public"."user" to "service_role";

grant insert on table "public"."user" to "service_role";

grant references on table "public"."user" to "service_role";

grant select on table "public"."user" to "service_role";

grant trigger on table "public"."user" to "service_role";

grant truncate on table "public"."user" to "service_role";

grant update on table "public"."user" to "service_role";