# PRD — my-lat-app

## Problem
The owner relies on rented platforms (Substack, Linktree, etc.) where they don't control the data, domain, or publishing flow. They need a self-owned site where they publish content and capture leads.

## Target User
One person: the site owner / builder. Visitors are anonymous readers who may submit their contact details.

## Core Objects
- **Post** — a piece of published content (title, body, slug, status, published_at)
- **Lead** — a visitor who submitted their contact info (name, email, source, notes)

## MVP Must-Haves
- [ ] Public homepage lists all published posts
- [ ] Public post detail page renders full content at `/posts/[slug]`
- [ ] Lead capture form on any page (name + email → saved to DB)
- [ ] Owner admin: create, edit, publish/unpublish posts
- [ ] Owner admin: view leads list with source and timestamp
- [ ] Site live on custom domain via Vercel

## Non-Goals (v1)
- Multi-author or team access
- Comments / social features
- Email newsletter send (capture only)
- Paid content / subscriptions
- Analytics dashboard
- Per-user login for visitors

## Success Criteria
Owner navigates to their domain, sees a published post, a visitor submits the lead form, and the owner views that lead in the admin — all without touching a third-party platform.