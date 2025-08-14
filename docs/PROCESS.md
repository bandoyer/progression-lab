# ProgressionLab — Lightweight Tracking Workflow

This repo uses **GitHub Issues + Projects** with three templates (Story, Task, Bug), a PR template, and ADRs.

## Board
Create a **GitHub Project (Board)** with columns: Backlog → Ready → In Progress → In Review → Done.
Add automation rules:
- When issue added → Backlog
- When PR linked and opened → In Review
- When PR merged or issue closed → Done

## Labels
Use: `story`, `task`, `bug`, `feature`, `docs`, `auth`, `backend`, `frontend`, `mobile`, `ios`, `priority/P0,P1,P2`.
You can run `scripts/setup-labels.sh` once to create them via the GitHub CLI.

## Definition of Ready (DoR)
A ticket is **Ready** if:
- Clear problem statement (for stories: As a/I want/So that)
- Acceptance criteria are testable
- Scope & out-of-scope written
- Estimable and no major unknowns

## Definition of Done (DoD)
- Tests updated/added, CI green
- PR description filled (template sections)
- Logs/telemetry added where useful
- Docs updated (README or /docs), ADR updated if it changes architecture

## AI agent rhythm (Junie)
1. **Draft ticket**: "Turn this idea into a User Story with acceptance criteria: <paste notes>"
2. **Split into tasks**: "Break Story #123 into 3–6 tasks with clear acceptance criteria."
3. **Test-first scaffolding**: "Generate xUnit test skeletons for Story #123 acceptance criteria."
4. **Draft implementation**: "Propose minimal changes to pass these tests (files and diffs)."
5. **PR description**: Use Rider AI button; it fills sections from our PR template and guidelines.
6. **Self review**: "List security/perf edge cases in this diff and suggest fixes."

## INVEST cue for stories
- **I**ndependent • **N**egotiable • **V**aluable • **E**stimable • **S**mall • **T**estable
