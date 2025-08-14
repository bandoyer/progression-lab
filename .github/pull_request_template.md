<!--
AI: Generate a concise PR description from the diff + commit messages.
Fill the sections below. Use crisp bullets. If a section doesn’t apply, write “N/A”.

Format:
- What: 3–6 bullets, start with verb, call out net-new vs modified code.
- Why: 1–3 bullets linking problem/story/issue.
- How tested: list unit/integration/manual steps; mention edge cases.
- Impact: API endpoints changed, DB migrations, security/privacy, perf, observability.
- Risks & Rollback: risk level (low/med/high), how to revert, feature flag if any.

Also list the most impacted files or modules.
-->

## What
- 

## Why
- 

## How I tested
- 

## Impact
**API:**
- [ ] New endpoint(s):
- [ ] Breaking changes:  
  **DB:**
- [ ] Migration(s):  
  **Security/Privacy:**
- [ ] Secrets, PII, auth changes  
  **Performance:**
- [ ] Hot paths, memory/allocs, latency notes  
  **Observability:**
- [ ] Logs, metrics, traces, health checks

## Risks & Rollback
- **Risk:** low / medium / high
- **Rollback plan:** (e.g., revert PR, disable flag, restore backup)

## Screenshots / Recording (optional)
- 

## Notes / Follow-ups
- 

---
### Checklist
- [ ] Builds & tests pass (`dotnet build`, `dotnet test`)
- [ ] CI is green
- [ ] Conventional commit title (feat/fix/chore/docs/refactor/test)
- [ ] Linked issue(s) (e.g., Closes #123)
- [ ] Tests added/updated (unit/integration) when appropriate
- [ ] Docs updated (README or `/docs`) if needed
- [ ] No secrets or licensed assets committed
