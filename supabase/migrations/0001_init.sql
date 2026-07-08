create table if not exists posts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  title text not null,
  slug text not null unique,
  body text,
  status text not null default 'draft',
  published_at timestamptz,
  created_at timestamptz not null default now()
);

alter table posts enable row level security;

drop policy if exists "posts_v1_read" on posts;
create policy "posts_v1_read" on posts for select using (true);

drop policy if exists "posts_v1_write" on posts;
create policy "posts_v1_write" on posts for all using (true) with check (true);

create table if not exists leads (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  name text not null,
  email text not null,
  source text,
  notes text,
  score numeric,
  score_source text,
  score_confidence numeric,
  score_review_status text default 'unreviewed',
  created_at timestamptz not null default now()
);

alter table leads enable row level security;

drop policy if exists "leads_v1_read" on leads;
create policy "leads_v1_read" on leads for select using (true);

drop policy if exists "leads_v1_write" on leads;
create policy "leads_v1_write" on leads for all using (true) with check (true);

create table if not exists audit_logs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  actor text,
  action text not null,
  object_type text not null,
  object_id uuid,
  before jsonb,
  after jsonb,
  created_at timestamptz not null default now()
);

alter table audit_logs enable row level security;

drop policy if exists "audit_logs_v1_read" on audit_logs;
create policy "audit_logs_v1_read" on audit_logs for select using (true);

drop policy if exists "audit_logs_v1_write" on audit_logs;
create policy "audit_logs_v1_write" on audit_logs for all using (true) with check (true);

insert into posts (id, title, slug, body, status, published_at) values
  (gen_random_uuid(), 'Welcome to My Site', 'welcome-to-my-site', '## Hello\n\nThis is my first post. I write about things I find interesting — technology, building in public, and ideas worth sharing.\n\nStay tuned for more.', 'published', now()),
  (gen_random_uuid(), 'Why I Decided to Own My Content', 'why-i-own-my-content', '## Owning Your Platform\n\nRented platforms are convenient until they change the rules. Here is why I moved everything to a site I fully control.\n\n- No algorithm suppression\n- My data, my domain\n- Portable forever', 'published', now() - interval '3 days'),
  (gen_random_uuid(), 'The Tools I Use Every Day', 'tools-i-use-every-day', '## My Daily Stack\n\nA quick rundown of the tools that make up my working environment in 2024.\n\n*(Draft — finishing soon)*', 'draft', null)
on conflict (slug) do nothing;

insert into leads (name, email, source, notes) values
  ('Alex Rivera', 'alex.rivera@example.com', 'welcome-to-my-site', 'Mentioned they found the site via a friend'),
  ('Jordan Kim', 'jordan.kim@example.com', 'why-i-own-my-content', null),
  ('Morgan Patel', 'morgan.patel@example.com', 'homepage', 'Interested in the tools post');