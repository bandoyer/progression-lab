# Backlog Seed (first pass)

## EPIC: Authentication & Authorization
- **story:** IdP as separate service
  - Acceptance: discovery doc available; code+PKCE; refresh tokens; scopes `api offline_access email profile`
- **task:** Add OpenIddict + Identity packages and wire server endpoints
- **task:** Seed dev clients (`progressionlab-web`, `progressionlab-mobile`)
- **story:** Identity UI (register/login/logout), email confirmation (smtp4dev)
- **story:** API scope enforcement (`ApiScope`), protect `/api/*`

## EPIC: Progression Engine
- **story:** Estimate 1RM using Epley/Brzycki with configuration
- **story:** Compute next-week targets (1–5% bump, RPE cap, deload rule)
- **task:** Plate math + rounding (kg/lb, increments)
- **task:** Unit tests for engine edge cases

## EPIC: Logging & Sessions
- **story:** Log sets with 2-tap mobile-friendly UI (web first)
- **task:** Session model + persistence
- **task:** `GET /sessions/:id` and `POST /sets` endpoints

## EPIC: Tooling & Quality
- **task:** CI build/test workflow
- **task:** Dependabot weekly updates
- **task:** Add observability (structured logs, health checks)
