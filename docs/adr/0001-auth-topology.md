# ADR 0001 — Authentication & Authorization Topology

- **Status:** Accepted
- **Date:** 2025-08-14
- **Owner:** ProgressionLab

## Context
We need secure user accounts and a future-proof way to authenticate users across:
- a web experience (server-rendered/BFF),
- a public API for first-party clients,
- native iOS/Apple Watch apps.

We want modern best practices (OIDC/OAuth2, PKCE, short-lived access tokens, refresh tokens), $0 local dev, and a clear path to scale or swap identity providers (e.g., Microsoft Entra).

## Decision
Adopt a **separate Identity Provider (IdP)** service using **OpenIddict + ASP.NET Identity**, with:
- **Authorization Code + PKCE** flow for all interactive clients.
- **Refresh tokens** (rotated, revoke-on-use).
- **Scopes**: `api` (resource access), `offline_access` (refresh), `email`, `profile`.
- **Claims/roles** for app-level authorization.
- **API** validates tokens issued by the IdP and enforces `scope=api`.

**Topology (initial deployment shape)**
- `ProgressionLab.IdP` → OpenIddict server endpoints (`/connect/authorize`, `/connect/token`, `/connect/userinfo`, `/connect/logout`) and Identity UI (login/register/consent).
- `ProgressionLab.Api` → resource server (JSON). Requires `[Authorize(Policy="ApiScope")]` where `ApiScope` = `scope contains "api"`.
- `ProgressionLab.Web` (optional, staged later) → BFF: server-side session; tokens stay on server; browser only has an HTTP-only cookie.

**Local dev:** All services in one solution; IdP on `https://localhost:<idp-port>`.  
**Prod:** Independent deployables, e.g.:
- IdP: `https://id.progressionlab.app`
- API: `https://api.progressionlab.app`
- Web: `https://app.progressionlab.app`

## Rationale
- **Security:** Standards-based flows; BFF keeps tokens out of the browser; short-lived access tokens plus rotated refresh tokens.
- **Portability:** Clients and API depend only on OIDC metadata; we can federate to or replace with Entra later by changing `Authority`.
- **Scalability:** IdP, API, and Web can scale/harden independently; clear trust boundaries.

## Alternatives Considered
- **JWT-only, app-issued tokens (no OIDC):** simpler, but harder to add native apps and external IdPs later; rework likely.
- **Co-hosting IdP inside API:** fastest start, but couples concerns and complicates future split/federation.
- **Hosted IdP (Auth0/Okta/Entra) from day 1:** quick, but adds cost and external dependency while we’re still iterating.

## Consequences
**Positive**
- Clean separation of concerns; easy to add new clients (iOS, Watch).
- Swap/federate IdPs later with minimal client changes.
- Aligns with security best practices (PKCE, refresh rotation).

**Negative / Trade-offs**
- More initial wiring (Identity UI, consent, keys).
- We own key rotation and email flows (dev: `smtp4dev`; prod: managed SMTP).

## Operational Notes
- **Tokens:** access 10–15 min; refresh 30–90 days; rotate + revoke on refresh.
- **Scopes:** `api`, `offline_access`, `email`, `profile`.
- **Claims/roles:** app roles for admin/privileged features.
- **Keys:** dev signing/encryption certs locally; real certs + rotation before production.
- **Security:** enforce email confirmation before issuing tokens; enable TOTP 2FA; log auth events; expose health checks.
- **Discovery:** publish `/.well-known/openid-configuration` (OpenIddict does this).

## Follow-ups
- ADR-0002: Consent UX and scope grant strategy.
- ADR-0003: Key management & token lifetime policy (dev vs prod).
- ADR-0004: Web BFF pattern details and CSRF strategy.
