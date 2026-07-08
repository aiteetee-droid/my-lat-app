# Intelligence Layer — my-lat-app

## v1: Rule-Based Only
No AI in v1. Logic is deterministic.

## Events to Track
- Post published (status changes to 'published')
- Lead submitted (new row in leads)
- Lead annotated by owner (notes updated)

## Lead Scoring (Next — rule-based first)
Score leads 1–10 by simple rules:
- Has a real-looking email domain (not gmail/yahoo): +2
- Submitted from a specific post (not homepage): +1
- Owner has annotated the lead: +2

Schema per scored lead:
```json
{
  "score": 6,
  "score_source": "rule_engine_v1",
  "score_confidence": 0.85,
  "score_review_status": "unreviewed"
}
```

## Later — AI Features
- Auto-draft post from a URL or bullet list (low risk, owner reviews before publish)
- Suggest post topics based on which posts drive most leads
- Classify lead intent from source page

## Why Rules First
Scoring runs even with AI disabled. AI replaces the rule engine only after the rule baseline is measured.