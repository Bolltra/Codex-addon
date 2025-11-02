# Codex Home Assistant Add-ons

Detta repo innehaller en Home Assistant add-on for att kora Codex CLI i en webbaserad terminal. Installera det har repositoriet i Home Assistant for att komma at tillagget via Supervisor.

## Add-ons

- [Codex Terminal](./codex-terminal) - Installerar en webterminal (ttyd) med Codex CLI for att kunna kora kommandon direkt fran Home Assistant.

## Anvandning

1. Lagga till detta repo som en extern add-on katalog i Home Assistant.
2. Installera "Codex Terminal" fran listan av tillagg.
3. Starta tillagget och oppna webUI for att fa en terminal med `codex` CLI forhandsinstallerad.

Mer information om varje add-on finns i respektive katalog.

## Bygg och publicera containerbilder

Add-onen ar konfigurerad for att anvanda forbyggda containerbilder fran GitHub Container Registry (GHCR). Workflowen `.github/workflows/build.yaml` bygger och pusha en bild per arkitektur (amd64, aarch64, armv7) varje gang kod i `codex-terminal/` andras eller nar workflowen triggas manuellt.

Standardkonfigurationen anvander GitHubs inbyggda `GITHUB_TOKEN` for att publicera bilder till `ghcr.io/<ditt-anvandarnamn>/codex-terminal-<arch>`. Se till att repo:t ar publikt (eller att du har aktiverat Packages-skrivrattigheter pa `GITHUB_TOKEN`) och kontrollera att workflowen kornar minst en gang innan du installerar tillagget i Home Assistant, annars finns ingen bild att dra.
