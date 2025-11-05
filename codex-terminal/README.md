# Codex Terminal Add-on

Codex Terminal exposes a ttyd-powered shell inside Home Assistant with the official OpenAI Codex CLI (`@openai/codex`) preinstalled. The goal is to let you build and troubleshoot automations, inspect logs, and iterate on configuration without leaving the Home Assistant UI.

## Features

- Web terminal served through Home Assistant Ingress (no extra ports required).
- Codex CLI (`npm install -g @openai/codex`) preinstalled and auto-launched on session start.
- Shared access to core Home Assistant folders (`config`, `share`, `ssl`, `media`).

## Installation

1. Add this repository under **Supervisor → Add-on Store → Add-on repositories**.
2. Ensure the GitHub Actions workflow `Build Codex Terminal Add-on` has pushed the latest images to `ghcr.io/bolltra/codex-terminal-<arch>` (or your own namespace if you fork the project).
3. Install “Codex Terminal” from the Add-on Store.
4. Start the add-on and open the Ingress link to launch the terminal.

## Configuration

| Option            | Default   | Description                                                                                                  |
|-------------------|-----------|----------------------------------------------------------------------------------------------------------------|
| `log_level`       | `info`    | Controls Supervisor log verbosity (`info`, `debug`, `warning`, `error`).                                     |
| `openai_api_key`  | *(empty)* | Optional API key used to authenticate automatically on startup (`codex login --with-api-key`).               |
| `full_auto`       | `false`   | When `true`, Codex launches with `--full-auto` (no approval prompts, workspace write sandbox). Use carefully.  |
| `start_mode`      | `new`     | `new` starts a fresh session; `resume` runs `codex resume --last` so you continue where you left off.          |

## Usage

- Open the Ingress link to access the terminal session.
- Codex CLI starts automatically (equivalent to running `codex`) when the terminal loads. Type `exit` to return to a plain shell.
- If you provided `openai_api_key`, the add-on authenticates automatically. Otherwise run `codex login` and follow the on-screen instructions (see “Headless login tips” below).
- Toggle `full_auto` if you want Codex to execute commands without prompting. This skips approval prompts but still runs inside Codex's sandbox.
- Set `start_mode` to `resume` if you always want to continue the latest session (`codex resume --last`).
- Run `codex --help` for usage details (`codex` opens interactive mode, `codex --shell` generates shell commands, etc.).

## Troubleshooting

- Review the add-on logs if the terminal fails to start.
- If the CLI fails to start, ensure the add-on image is up to date or run `npm install -g @openai/codex` inside the container, then restart the add-on.
- For headless ChatGPT sign-in, either tunnel port 1455 from the add-on container (e.g. via SSH or `docker exec` port forward) or authenticate on another machine and copy `$CODEX_HOME/auth.json` into the add-on (stored under `/config/codex`). Using `openai_api_key` is the simplest path in Home Assistant.

## Updating Codex CLI

- The GitHub Actions workflow runs weekly (Monday 03:00 UTC) to rebuild images, automatically installing the latest `@openai/codex` release from npm.
- For an on-demand upgrade inside a running container, run:

```bash
npm install -g @openai/codex
```

Then restart the add-on so new sessions use the updated CLI.

### Headless login tips

- Authentication files live in `/config/codex` (`CODEX_HOME`). You can copy `auth.json` there via File Editor/Studio Code Server and restart the add-on.
- On first run the add-on seeds an `AGENTS.md` file in the same directory with a Home Assistant-focused agent description that Codex loads automatically.
- Prefer to authenticate elsewhere? Run `codex login` on another machine, then copy `~/.codex/auth.json` to `/config/codex/auth.json` and restart the add-on.
