#!/bin/sh
# Ensure Codex's persistent npm prefix stays first in PATH for login shells.

CODEX_HOME=${CODEX_HOME:-/config/codex}
NPM_CONFIG_PREFIX="${NPM_CONFIG_PREFIX:-${CODEX_HOME}/.npm-global}"
NPM_CONFIG_CACHE="${NPM_CONFIG_CACHE:-${CODEX_HOME}/.npm-cache}"

export CODEX_HOME
export NPM_CONFIG_PREFIX
export NPM_CONFIG_CACHE

case ":$PATH:" in
    *":${NPM_CONFIG_PREFIX}/bin:"*) ;;
    *) export PATH="${NPM_CONFIG_PREFIX}/bin:${PATH}" ;;
esac
