#!/usr/bin/env bash
set -euo pipefail
# Requires: GitHub CLI `gh` authenticated in this repo.
create() { gh label create "$1" --color "$2" --description "${3:-}" || true; }
create "story" "5319e7" "User story"
create "task" "0e8a16" "Task"
create "bug" "d73a4a" "Bug"
create "feature" "1d76db" "Feature"
create "docs" "0075ca" "Documentation"
create "auth" "5319e7" "Authentication/Authorization"
create "backend" "fbca04" "Backend"
create "frontend" "c2e0c6" "Frontend"
create "mobile" "0e8a16" "Mobile"
create "ios" "5319e7" "iOS"
create "priority/P0" "b60205" "Highest priority"
create "priority/P1" "d93f0b" "High priority"
create "priority/P2" "fbca04" "Medium priority"
echo "Labels created (or already existed)."
