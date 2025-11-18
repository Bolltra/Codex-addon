# Codex Terminal for Home Assistant

Bring the official OpenAI Codex CLI straight into Home Assistant. The add-on ships a web terminal (ttyd) that launches `codex` as soon as you open it, with all your Home Assistant configuration files mounted for quick iteration on automations, scripts, dashboards, and logs.

> **Status:** Works on Home Assistant OS / Supervised (amd64, aarch64, armv7).

---

## Features

- One-click Codex terminal inside the Home Assistant UI (Ingress support, no extra ports).
- Uses the official `@openai/codex` package; ttyd starts `codex` automatically.
- Full access to `/config`, `/share`, `/media`, and `/ssl` so you can review or edit automations on the fly.
- Credentials and agent prompt stored under `/config/codex` – easy to back up or tweak with File Editor/Studio Code Server.
- Optional automatic login using an OpenAI API key; ChatGPT login by copying credentials from another machine is recommended for Plus/Pro/Team users.
- Start mode toggle: launch a fresh session or open the session picker to resume a previous one.
- Full-auto toggle to let Codex execute without per-command approval.
- Codex CLI installs into `/config/codex/.npm-global`, so in-session updates persist across add-on restarts.

---

## Requirements

- Home Assistant OS or Supervised installation (Supervised menu available).
- OpenAI account with Codex CLI access (ChatGPT Plus/Pro/Team or API key with Responses API write permissions).
- Optional: File Editor/Studio Code Server add-on to edit files under `/config`.

---

## Installation

1. In Home Assistant, go to `Settings → Add-ons → Add-on store → ⋮ → Repositories` and add:
   ```
   https://github.com/Bolltra/Codex-addon
   ```
2. Search for **“Codex Terminal”**, press **Install**, then review the configuration (below).
3. Press **Start** and **Open Web UI**. The web terminal launches `codex` immediately.

> Tip: Pin the add-on to the sidebar for quick access.

---

## Configuration options

The add-on exposes the following options (UI → Configuration tab):

| Option            | Description                                                                                                  |
|-------------------|--------------------------------------------------------------------------------------------------------------|
| `log_level`       | Supervisor log level (`info`, `debug`, `warning`, `error`).                                                  |
| `openai_api_key`  | Optional – paste an OpenAI API key to auto-login on start via `codex login --with-api-key`.                  |
| `start_mode`      | `new` starts fresh; `resume` opens the session picker (press `Esc` there to start a new session).             |
| `full_auto`       | When `true`, Codex starts with `--full-auto` (executes without approval prompts, still within Codex sandbox). |

### Authentication options

Choose **one** of the following (ChatGPT auth is recommended if you have Plus/Pro/Team):

**A. ChatGPT login (recommended for Plus/Pro/Team)**
1. Install the Codex CLI on another machine (`npm install -g @openai/codex`).
2. Run `codex login` there and complete the browser flow.
3. Copy the resulting `~/.codex/auth.json` to `/config/codex/auth.json` on Home Assistant (e.g. via File Editor/VS Code).
4. Restart the add-on. Codex starts authenticated without interactive login inside HA.

**B. API key (usage-based billing)**
1. Create an API key in the OpenAI dashboard that can access the Responses API.
2. Paste the key into `openai_api_key` in the add-on configuration and save.
3. Start/restart the add-on. It logs in automatically and writes credentials to `/config/codex/auth.json`.

> You can repeat these steps any time to refresh credentials. The add-on never exposes secrets to other containers.

---

## Customising the assistant prompt

- On first launch the add-on creates `/config/codex/AGENTS.md` with a Home Assistant–focused system prompt.
- Open that file in File Editor/Studio Code Server, tailor the instructions (e.g. preferred style, allowed actions), and save.
- Restart the terminal (close/reopen the web UI) to load the new prompt.

You can store additional prompt snippets or reference YAML files in the same folder – Codex sees everything under `/config`.

---

## Using Codex in Home Assistant

1. Start the add-on and click **Open Web UI**.
2. A ttyd terminal opens and immediately runs `codex` from `/config`.
3. Codex starts automatically and stays in Codex; exiting the process closes the terminal. 

> When the Ingress session starts Codex checks for updates and can install them automatically. Updates are written to `/config/codex/.npm-global` and persist across add-on restarts.

Codex cannot call Home Assistant services directly; it suggests YAML/scripts/commands you can run or automate yourself.

---

Credentials (`auth.json`) and prompts (`AGENTS.md`) persist under `/config/codex`; back them up with the rest of your HA config.

---

## Authentication & headless login

- Best option: create an OpenAI API key with Responses API access and set `openai_api_key` in the add-on config. It auto-logs in on start.
- Alternatively, log in with ChatGPT Plus/Pro/Team on another machine: run `codex login`, then copy `~/.codex/auth.json` to `/config/codex/auth.json` (via File Editor/Studio Code Server). Restart the add-on.

Credentials (`auth.json`) and prompts (`AGENTS.md`) persist under `/config/codex`; back them up with the rest of your HA config.

---

## Contributing & support

Pull requests and issues are welcome via [github.com/Bolltra/Codex-addon](https://github.com/Bolltra/Codex-addon). This project is community-maintained and not an official OpenAI release.

Need help with Codex CLI itself? See:
- [Codex CLI GitHub repo](https://github.com/openai/codex)
- [Authentication docs](https://github.com/openai/codex/blob/main/docs/authentication.md)
- [OpenAI help centre](https://help.openai.com/)

Enjoy coding with Codex inside Home Assistant!
