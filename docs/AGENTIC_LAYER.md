# Agentic Layer — my-lat-app

## Risk Levels & Actions

### Low — Auto (no approval needed)
- Tag a lead's source from the referring slug
- Mark a post slug as URL-safe (sanitise on save)
- Auto-set `published_at` when status flips to 'published'

### Medium — Owner approves before execution
- Draft a new post from a URL or bullet list
- Suggest edits to an existing post body

### High — Always requires owner approval
- Bulk-export leads to CSV / send to external service
- Publish a post (status change visible publicly)

### Critical — Human-only, never automated
- Delete a post permanently
- Delete leads data
- Any action touching billing or domain config

## Named Tools (v1 — none yet; planned)
- `draft_post(input: string) → Post draft` — medium risk
- `score_lead(lead_id: uuid) → score fields` — low risk

## Audit Log Fields
Every meaningful action records: `actor`, `action`, `object_type`, `object_id`, `before`, `after`, `timestamp`.

## v1 Scope
No agentic tools ship in v1. Audit logging for post publish/unpublish and lead creation is added in Sprint 2.