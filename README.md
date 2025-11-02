# Codex Terminal for Home Assistant

Bring the official OpenAI Codex CLI straight into Home Assistant. The add-on ships a web terminal (ttyd) that launches `codex` as soon as you open it, with all your Home Assistant configuration files mounted for quick iteration on automations, scripts, dashboards, and logs.

> **Status:** Works on Home Assistant OS / Supervised (amd64, aarch64, armv7).

---

## Features

- One-click Codex terminal inside the Home Assistant UI (Ingress support, no extra ports).
- Uses the official `@openai/codex` package; ttyd starts `codex` automatically.
- Full access to `/config`, `/share`, `/media`, and `/ssl` so you can review or edit automations on the fly.
- Credentials and agent prompt stored under `/config/codex` – easy to back up or tweak with File Editor/Studio Code Server.
- Optional automatic login using an OpenAI API key; manual ChatGPT login also supported.

---

## Requirements

- Home Assistant OS or Supervised installation (Supervised menu available).
- OpenAI account with Codex CLI access (ChatGPT Plus/Pro/Team or API key with Responses API write permissions).
- Optional: File Editor/Studio Code Server add-on to edit files under `/config`.

---

## Installation

1. **Add this repository** in Home Assistant: `Settings → Add-ons → Add-on store → ⋮ → Repositories` and paste
   ```
   https://github.com/Bolltra/Codex-addon
   ```
2. Search for **“Codex Terminal”** and press **Install**.
3. Open the add-on page and review the configuration (see below).
4. Press **Start**, then **Open Web UI**. The web terminal launches `codex` immediately.

> Tip: Pin the add-on to the sidebar for quick access.

---

## Configuration options

The add-on exposes two simple options (UI → Configuration tab):

| Option            | Description                                                                                     |
|-------------------|-------------------------------------------------------------------------------------------------|
| `log_level`       | Supervisor log level (`info`, `debug`, `warning`, `error`).                                     |
| `openai_api_key`  | Optional – paste an OpenAI API key to auto-login on start via `codex login --with-api-key`.     |

### Authentication options

Choose **one** of the following:

**A. API key (usage-based billing)**
1. Create an API key in the OpenAI dashboard that can access the Responses API.
2. Paste the key into `openai_api_key` in the add-on configuration and save.
3. Start/restart the add-on. It logs in automatically and writes credentials to `/config/codex/auth.json`.

**B. ChatGPT login (interactive, no API key)**
1. Install the Codex CLI on your computer (`npm install -g @openai/codex`).
2. Run `codex login`, complete the browser flow, and confirm `~/.codex/auth.json` appears.
3. Copy that file to your Home Assistant machine (e.g. via File Editor/VS Code) and place it at `/config/codex/auth.json`.
4. Restart the add-on. Codex now starts authenticated.

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
3. Interact as usual:
   ```
   codex           # start/continue interactive session
   codex --help    # list subcommands
   codex --shell "write an automation that..."  # single-shot prompts
   ```
4. Type `exit` to drop back to a plain shell (still rooted in `/config`).

Codex cannot call Home Assistant services directly; it suggests YAML/scripts/commands you can run or automate yourself.

---

## Updates & maintenance

- This repository’s GitHub Actions workflow rebuilds images every Monday (03:00 UTC) to bundle the latest `@openai/codex` release.
- To upgrade manually:
  1. Pull the latest changes or trigger the workflow.
  2. In Home Assistant, open the add-on page and click **Update** (or uninstall/reinstall if auto-update is off).
- Inside the running container you can also run `npm install -g @openai/codex` and restart the add-on.

Credentials (`auth.json`) and prompts (`AGENTS.md`) persist under `/config/codex`; back them up with the rest of your HA config.

---

## Troubleshooting

| Symptom | Suggested fix |
|---------|----------------|
| `codex` says “Unknown error” after login | The browser could not reach the internal callback. Use the API key option or copy `auth.json` from a trusted machine. |
| CLI opens a plain bash prompt | The Codex binary was not found. Check the logs; reinstall or run `npm install -g @openai/codex` then restart. |
| Permissions error writing to `/config/codex` | Ensure the folder exists and is writable (the init script creates it with `chmod 700`). |
| Want to reset login | Delete `/config/codex/auth.json` and restart (you will be prompted to log in again). |

View full logs under **Settings → System → Logs**, or the add-on log tab.

---

## Contributing & support

Pull requests and issues are welcome via [github.com/Bolltra/Codex-addon](https://github.com/Bolltra/Codex-addon). This project is community-maintained and not an official OpenAI release.

Need help with Codex CLI itself? See:
- [Codex CLI GitHub repo](https://github.com/openai/codex)
- [Authentication docs](https://github.com/openai/codex/blob/main/docs/authentication.md)
- [OpenAI help centre](https://help.openai.com/)

Enjoy coding with Codex inside Home Assistant!
