# Architecture — my-lat-app

## Stack
- **Frontend/Backend:** Next.js 14 (App Router) on Vercel
- **Database:** Supabase (Postgres + RLS)
- **Auth (later):** Supabase Auth for owner login
- **Domain:** Custom domain pointed at Vercel

## Now vs Later
**Now:** Posts table, Leads table, public reader pages, admin CRUD pages (no login wall), lead capture form persisting to DB.
**Later:** Owner auth + RLS lock-down, rich-text editor, lead tagging, email export, AI post-draft suggestions.

## Key User Action — Visitor Submits a Lead
1. Visitor lands on a post page (Next.js SSR fetches post from Supabase)
2. Fills name + email in lead form and submits
3. Next.js API route validates input
4. Row inserted into `leads` table with `source = slug` and `created_at`
5. Confirmation message shown; no page reload
6. Owner opens `/admin/leads` — row appears immediately

## Layer Plan
1. **Data first** — tables, constraints, seed rows, open RLS policies
2. **App logic** — CRUD API routes, SSR pages, form handling
3. **Smart features (later)** — lead scoring, draft suggestions

## Core Without AI
All publishing and lead capture work as pure DB read/write. AI features are additive overlays; removing them leaves a fully working site.