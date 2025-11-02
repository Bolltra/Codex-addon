ARG BUILD_FROM
FROM ${BUILD_FROM}

ARG TTYD_VERSION="1.7.7"

ENV LANG=C.UTF-8 \
    S6_KEEP_ENV=1 \
    DEBIAN_FRONTEND=noninteractive \
    CODEX_HOME=/data/codex

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        git \
        gnupg; \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /usr/share/keyrings/nodesource.gpg; \
    echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" > /etc/apt/sources.list.d/nodesource.list; \
    apt-get update; \
    apt-get install -y --no-install-recommends nodejs; \
    npm install -g @openai/codex; \
    npm cache clean --force; \
    arch="$(dpkg --print-architecture)"; \
    case "${arch}" in \
        amd64) ttyd_asset="ttyd.x86_64" ;; \
        arm64) ttyd_asset="ttyd.aarch64" ;; \
        armhf|armel) ttyd_asset="ttyd.arm" ;; \
        arm) ttyd_asset="ttyd.arm" ;; \
        armv7l) ttyd_asset="ttyd.arm" ;; \
        *) echo "Unsupported architecture: ${arch}"; exit 1 ;; \
    esac; \
    curl -L -o /tmp/ttyd "https://github.com/tsl0922/ttyd/releases/download/${TTYD_VERSION}/${ttyd_asset}"; \
    install -m 0755 /tmp/ttyd /usr/local/bin/ttyd; \
    rm -f /tmp/ttyd; \
    apt-get purge -y gnupg; \
    apt-get autoremove -y; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

COPY rootfs/ /

RUN chmod +x /etc/services.d/codex/run /etc/cont-init.d/10-log-level
