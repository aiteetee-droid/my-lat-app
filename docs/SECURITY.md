# Security — my-lat-app

## Secrets
- `SUPABASE_SERVICE_ROLE_KEY` lives only in Vercel env vars, used server-side only
- `NEXT_PUBLIC_SUPABASE_ANON_KEY` is the only key exposed to the browser
- No secrets in source code or committed `.env` files

## Permissions (v1 — open demo)
- RLS enabled on all tables with permissive v1 policies
- Admin pages at `/admin/*` are unprotected in v1 (acceptable: personal tool, not yet public)

## Lock-Down Sprint (before real data goes in)
- Add Supabase Auth; owner signs in
- Replace v1 RLS policies with `auth.uid() = user_id` for writes
- Admin routes check session server-side; redirect to `/login` if unauthenticated
- Leads remain readable server-side only (never exposed via public API)

## Approved Tools Rule
- Only named, scoped Supabase client calls are used — no `eval`, no `exec`, no raw arbitrary DB queries from user input
- Agent actions (future) use typed tool functions, not freeform SQL

## Audit Principle
Every post status change and lead creation is logged. Logs are append-only; no row is silently mutated without a corresponding log entry.