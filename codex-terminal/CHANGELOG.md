## 0.2.0
- Codex CLI now runs directly from `/config`, auto-launching in the terminal while preserving credentials under `/config/codex`.
- Added `AGENTS.md` seeding with a Home Assistant-focused system prompt and optional automatic login via `openai_api_key`.
- Branded add-on icon for Home Assistant UI and an end-user README overhaul with detailed setup steps.

## 0.1.1
- Added GHCR-backed build pipeline and switched to a Debian-based runtime for more reliable dependencies.
- Install Node.js and bundle the official `@openai/codex` CLI globally; ttyd is still provided per architecture.
- Codex CLI auto-starts in the terminal; optional `openai_api_key` configuration logs in automatically and stores credentials under `/config/codex` alongside a seeded `AGENTS.md`.

## 0.1.0
- Initial Codex Terminal add-on release.
