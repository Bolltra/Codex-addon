# Codex Terminal Add-on

Codex Terminal exposes a ttyd-powered shell inside Home Assistant with the official OpenAI Codex CLI (`@openai/codex`) preinstalled. The goal is to let you build and troubleshoot automations, inspect logs, and iterate on configuration without leaving the Home Assistant UI.

## Features

- Web terminal served through Home Assistant Ingress (no extra ports required).
- Codex CLI (`npm install -g @openai/codex`) preinstalled and auto-launched on session start.
- Shared access to core Home Assistant folders (`config`, `share`, `ssl`, `media`).
- Codex installs into `/config/codex/.npm-global`, so in-session updates persist across add-on restarts.

## Installation

1. In Home Assistant, open **Settings → Add-ons → Add-on store → ⋮ → Repositories** and add `https://github.com/Bolltra/Codex-addon`.
2. Install **Codex Terminal** from the Add-on Store.
3. Start the add-on and click **Open Web UI** to launch Codex in Ingress.

## Configuration

| Option            | Default   | Description                                                                                                  |
|-------------------|-----------|----------------------------------------------------------------------------------------------------------------|
| `log_level`       | `info`    | Controls Supervisor log verbosity (`info`, `debug`, `warning`, `error`).                                     |
| `openai_api_key`  | *(empty)* | Optional API key used to authenticate automatically on startup (`codex login --with-api-key`).               |
| `full_auto`       | `false`   | When `true`, Codex launches with `--full-auto` (no approval prompts, workspace write sandbox). Use carefully.  |
| `start_mode`      | `new`     | `new` starts a fresh session; `resume` opens the session picker (press `Esc` there to start a new session).   |

## Usage

- Open the Ingress link to access the terminal session.
- Codex starts automatically and remains active; exiting Codex closes the terminal.
- Toggle `full_auto` to let Codex run without approval prompts (still in Codex sandbox).
- Set `start_mode` to `resume` to open the session picker; press `Esc` there to start a new session.
- When a session starts Codex may prompt to update; updates are written to `/config/codex/.npm-global` and persist across restarts.

## Authentication (recommended first)

- Preferred: log in with ChatGPT Plus/Pro/Team on another machine. Run `codex login` there, then copy `~/.codex/auth.json` to `/config/codex/auth.json` in Home Assistant (File Editor/VS Code). Restart the add-on.
- Alternative: create an OpenAI API key with Responses API access and set `openai_api_key` in the add-on config for automatic login.

Authentication files live in `/config/codex` (`CODEX_HOME`). The add-on seeds an `AGENTS.md` prompt there on first run; edit it to customize behavior.

## Troubleshooting

- Review the add-on logs if the terminal fails to start.
- If Codex is missing, ensure the image is up to date; the add-on will reinstall into `/config/codex/.npm-global` on start.
