# Codex Terminal Add-on

Codex Terminal ger dig en webbaserad terminal (ttyd) inne i Home Assistant med Codex CLI forinstallerad. Tanken ar att du snabbt ska kunna kora `codex` direkt i webblasan utan att lamna Home Assistant.

## Funktioner

- ttyd-baserad terminal tillganglig via Home Assistant Ingress.
- Codex CLI forinstallerad via `pip`.
- Delning av vanliga Home Assistant mappar (`config`, `share`, `ssl`, `media`).

## Installation

1. Lagga till det har repositoriet i Home Assistant Supervisor under "Add-on store" > "Add-on repositories".
2. Hitta och installera "Codex Terminal".
3. Oppna tillagget och starta det. Ingress-lanken visas i gransen.

## Konfiguration

| Alternativ   | Standard | Beskrivning                 |
|--------------|----------|-----------------------------|
| `log_level`  | `info`   | Andra loggnivaa (info, debug, warning, error).

## Anvandning

- Oppna Ingress-lanken for att fa upp terminalen.
- Du loggas in som `root` i containern, och `codex` CLI finns installerad. Kor `codex --help` for att se tillgangliga kommandon.

## Felsokning

- Kontrollera loggarna for tillagget om terminalen inte startar.
- Om du behover resetta pip-cache kan du stoppa och starta om tillagget. Allt installeras pa nytt vid uppstart.
