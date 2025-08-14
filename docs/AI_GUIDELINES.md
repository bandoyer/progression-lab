# ProgressionLab – AI Guidelines

## PR descriptions (required sections)
Write concise, bullet-style PR descriptions. If a section doesn’t apply, write “N/A”.

### What
- 3–6 bullets; start with a verb; call out new modules vs. modified code.

### Why
- Problem/user story being solved; link issues.

### How I tested
- Unit/integration/manual steps; edge cases; commands.

### Impact
**API:** [ ] New endpoints / [ ] Breaking  
**DB:** [ ] Migrations  
**Security/Privacy:** [ ] Changes (auth, secrets, PII)  
**Performance/Observability:** key notes (hot paths, logs, metrics, traces)

### Risks & Rollback
- Risk: low / medium / high
- Rollback plan: revert PR / disable flag / restore backup

### Notes
- 3–5 most impacted files when relevant.

## Commit messages
Use Conventional Commits: `feat: …`, `fix: …`, `chore: …`, `docs: …`, `refactor: …`, `test: …`.

## Scope for AI
Prefer code/diff context; avoid marketing tone; no claims not supported by changes.
