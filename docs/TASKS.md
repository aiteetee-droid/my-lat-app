# Tasks — my-lat-app

## Sprint 1 — DB + Core Engine (Posts + Leads) ✦ v1 functional milestone
**Goal:** Public site shows published posts; lead form saves to DB; admin can create/publish posts and view leads — all without login.

- [ ] Run migration SQL (posts, leads tables, seed data, open RLS)
- [ ] Public homepage `/` — lists published posts (loading / empty / error / ready states)
- [ ] Public post page `/posts/[slug]` — renders full post body
- [ ] Lead capture form component — name + email → POST to `/api/leads`
- [ ] `/api/leads` route — validates, inserts row, returns confirmation
- [ ] Admin post list `/admin/posts` — lists all posts with status badge
- [ ] Admin create/edit post `/admin/posts/new` and `/admin/posts/[id]` — title, body, slug, status toggle
- [ ] Admin leads list `/admin/leads` — table of all leads with source + timestamp
- [ ] All screens handle loading, empty, partial, and error states
- [ ] Deploy to Vercel; connect custom domain

**Definition of Done:** Owner visits their domain, sees a seeded published post, submits the lead form as a visitor, then views that lead row in `/admin/leads`. Every button and form persists to the DB and the UI updates. No dead buttons.

---

## Sprint 2 — Polish & Audit
**Goal:** Owner edits feel solid; key actions are logged.

- [ ] Confirm-before-publish modal on post status toggle
- [ ] Owner can add notes to a lead from the admin leads page
- [ ] Audit log table + entries for post publish/unpublish and lead created
- [ ] Slug auto-generated from title (editable)
- [ ] 404 page for unknown slugs
- [ ] Basic page `<title>` and meta description per post

**Definition of Done:** Publish action creates an audit log row; lead notes save and persist on refresh.

---

## Sprint 3 — Lock It Down (Auth + RLS)
**Goal:** Admin is protected; data is owner-scoped before any real leads go in.

- [ ] Supabase Auth email/password for owner
- [ ] `/admin/*` routes redirect to `/login` if no session
- [ ] Replace v1 RLS policies with owner-scoped write policies
- [ ] Seed rows get `user_id` assigned to owner account
- [ ] Confirm public read still works (posts) without login

**Definition of Done:** Visiting `/admin/leads` without a session redirects to `/login`. After login, full admin works. Public post pages load without a session.

---

## Sprint 4 — Lead Scoring & Smart Features
- Rule-based lead scoring (email domain, source post, annotated)
- AI post-draft from bullet list (owner reviews before publish)
- Lead CSV export

---

## Gantt
```
Sprint 1 │████████████████│ DB, public site, admin CRUD, lead form  ← v1 functional
Sprint 2 │                │████████│ Audit, polish, meta
Sprint 3 │                │        │████████│ Auth + RLS lock-down
Sprint 4 │                │        │        │████████│ Scoring + AI
```