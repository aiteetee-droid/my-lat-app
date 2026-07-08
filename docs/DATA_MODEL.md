# Data Model — my-lat-app

## posts
| Field | Type | Notes |
|---|---|---|
| id | uuid PK | gen_random_uuid() |
| user_id | uuid nullable | owner scope (set at lock-down) |
| title | text not null | |
| slug | text not null unique | URL-safe identifier |
| body | text | markdown/HTML content |
| status | text | 'draft' \| 'published' |
| published_at | timestamptz nullable | set when status → published |
| created_at | timestamptz | default now() |

## leads
| Field | Type | Notes |
|---|---|---|
| id | uuid PK | gen_random_uuid() |
| user_id | uuid nullable | owner scope (set at lock-down) |
| name | text not null | |
| email | text not null | |
| source | text | slug or page path where form was submitted |
| notes | text nullable | owner can annotate |
| created_at | timestamptz | default now() |

### AI Fields (leads — future lead scoring)
- `score numeric` + `score_source text` + `score_confidence numeric` + `score_review_status text default 'unreviewed'`

## Relationships
- No FK between leads and posts (source is a freeform string for resilience)

## RLS (v1 — open for demo)
- All tables: permissive SELECT and ALL policies (see migration SQL)
- Lock-down sprint replaces with `auth.uid() = user_id`