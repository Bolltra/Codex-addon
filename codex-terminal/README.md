# Codex Terminal Add-on

Codex Terminal exposes a ttyd-powered shell inside Home Assistant with the Codex CLI ready to use. The goal is to let you build and troubleshoot automations, inspect logs, and iterate on configuration without leaving the Home Assistant UI.

## Features

- Web terminal served through Home Assistant Ingress (no extra ports required).
- Codex CLI preinstalled inside an isolated virtual environment.
- Shared access to core Home Assistant folders (`config`, `share`, `ssl`, `media`).

## Installation

1. Add this repository under **Supervisor → Add-on Store → Add-on repositories**.
2. Ensure the GitHub Actions workflow `Build Codex Terminal Add-on` has pushed the latest images to `ghcr.io/<your-username>/codex-terminal-<arch>`.
3. Install “Codex Terminal” from the Add-on Store.
4. Start the add-on and open the Ingress link to launch the terminal.

## Configuration

| Option          | Default | Description                                                                  |
|-----------------|---------|------------------------------------------------------------------------------|
| `log_level`     | `info`  | Controls Supervisor log verbosity (`info`, `debug`, `warning`, `error`).     |
| `system_prompt` | *(blank)* | Optional default system prompt injected when Codex CLI sessions start.        |

## Usage

- Open the Ingress link to access the terminal session.
- You are logged in as `root` and the Codex CLI is exposed on `PATH` via `/opt/codex-env/bin/codex`.
- Run `codex --help` to discover available commands or start chatting with `codex chat`.

## Troubleshooting

- Review the add-on logs if the terminal fails to start.
- Restarting the add-on reinstalls Python dependencies in the virtual environment if anything becomes corrupted.

## Updating Codex CLI

- The GitHub Actions workflow runs weekly (Monday 03:00 UTC) to rebuild images, automatically pulling the latest available `codex-cli` from PyPI.
- For an on-demand upgrade inside a running container, open the terminal and run:

```bash
source /opt/codex-env/bin/activate
pip install --no-cache-dir --upgrade codex-cli
deactivate
```

Restart the add-on after manual upgrades so future sessions pick up the updated binaries.
