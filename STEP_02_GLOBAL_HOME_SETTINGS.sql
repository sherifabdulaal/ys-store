-- YS Store V15.10.30 - Global Home Settings
-- Run once in Supabase SQL Editor.

create table if not exists public.home_settings (
  id integer primary key,
  settings jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.home_settings enable row level security;

drop policy if exists "Public can read home settings" on public.home_settings;
create policy "Public can read home settings"
on public.home_settings for select
to anon, authenticated
using (true);

drop policy if exists "Authenticated can insert home settings" on public.home_settings;
create policy "Authenticated can insert home settings"
on public.home_settings for insert
to authenticated
with check (id = 1);

drop policy if exists "Authenticated can update home settings" on public.home_settings;
create policy "Authenticated can update home settings"
on public.home_settings for update
to authenticated
using (id = 1)
with check (id = 1);

grant select on table public.home_settings to anon, authenticated;
grant insert, update on table public.home_settings to authenticated;

-- The first SAVE HOME PAGE from Admin will create row id=1
-- using the current Home Page Setup values from the admin browser.
