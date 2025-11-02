# Codex Home Assistant Add-ons

This repository hosts Home Assistant add-ons that expose the Codex CLI inside a web-based terminal. Add the repository to your Home Assistant Supervisor instance to access the add-on through the Add-on Store.

## Add-ons

- [Codex Terminal](./codex-terminal) – Provides a ttyd-powered web terminal with the Codex CLI preinstalled so you can run commands directly from Home Assistant.

## Usage

1. Add this repository as an external add-on source in Home Assistant.
2. Install “Codex Terminal” from the list of available add-ons.
3. Start the add-on and open the web UI to access a terminal session with the `codex` CLI ready to go.

Each add-on includes additional documentation in its own folder.

## Building and publishing container images

The add-on uses prebuilt container images published to GitHub Container Registry (GHCR). The workflow `.github/workflows/build.yaml` builds and pushes one image per architecture (amd64, aarch64, armv7) whenever code in `codex-terminal/` changes or when the workflow is triggered manually.

By default the workflow uses GitHub’s `GITHUB_TOKEN` to publish images to `ghcr.io/<your-username>/codex-terminal-<arch>` (for this repository, `ghcr.io/bolltra/codex-terminal-amd64`, etc.). Ensure the repository is public (or that Packages write permissions are granted to the token) and run the workflow at least once before installing the add-on so that Home Assistant can pull the image. A weekly scheduled run keeps the images fresh with the latest `@openai/codex` release from npm.
