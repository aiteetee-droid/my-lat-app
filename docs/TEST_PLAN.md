# Test Plan — my-lat-app

## Success Scenario (manual walkthrough)
1. Open the site homepage — confirm seeded published post titles are visible
2. Click a post title — confirm full body renders at `/posts/[slug]`
3. Fill name + email in lead form, submit — confirm success message appears
4. Open `/admin/leads` — confirm new lead row shows with correct name, email, source slug
5. Open `/admin/posts/new` — fill title, body; save as draft — confirm it appears in admin list with 'draft' badge
6. Toggle status to 'published' — confirm post now appears on the public homepage
7. Edit the post body — save — confirm updated body shows on the public post page

## Empty States
- Delete all seeded posts → homepage shows "No posts yet" message (not a blank page)
- No leads yet → `/admin/leads` shows "No leads yet" (not a blank table)

## Error Cases
- Submit lead form with invalid email → inline validation error, no DB insert
- Submit lead form with empty name → inline error, no insert
- Navigate to `/posts/a-slug-that-does-not-exist` → clean 404 page
- Supabase down → all pages show a user-friendly error, not a raw stack trace

## Persistence Check
- Create a post, hard-refresh the admin list → post still present (not just local state)
- Submit a lead, open a new incognito window to `/admin/leads` → lead is visible (DB-confirmed)

## Definition of Done Gate
All 7 success steps pass. All empty and error cases show correct UI. No raw errors exposed to the visitor.