## 0.3.3
- Ensure login shells keep Codex's persistent npm prefix first in PATH, preventing repeated update prompts across reconnects.

## 0.3.2
- Added English translations for configuration fields with clear labels and option text in the HA UI.
- Refreshed README instructions (install, usage/start mode, authentication flow).

## 0.3.1
- Persist Codex CLI under `/config/codex/.npm-global` so in-session updates survive add-on restarts.
- Expose persistent npm prefix/cache for Codex sessions and auto-installer.

## 0.3.0
- Added `full_auto` (launch with `--full-auto`) and `start_mode` (`new` vs `resume`) configuration flags.
- Codex now runs from `/config`, seeding `AGENTS.md` and persisting auth under `/config/codex`.
- Branded add-on icon and end-user focused README.

## 0.2.1
- Added `full_auto` configuration flag to launch Codex with `--full-auto` (no approval prompts) – includes warning in logs.
- Codex now logs in `/config` and seeds `AGENTS.md`; add-on icon and README refreshed for end users.

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
