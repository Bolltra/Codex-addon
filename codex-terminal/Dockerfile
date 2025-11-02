ARG BUILD_FROM
FROM ${BUILD_FROM}

ARG TTYD_VERSION="1.7.7"

ENV LANG=C.UTF-8 \
    S6_KEEP_ENV=1 \
    DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        git \
        python3 \
        python3-venv \
        python3-pip \
        python3-dev \
        build-essential \
        pkg-config \
        libjpeg-dev \
        zlib1g-dev \
        libfreetype6-dev \
        liblcms2-dev \
        libopenjp2-7-dev \
        libtiff-dev \
        libwebp-dev \
        libpng-dev \
        libxslt1-dev \
        libffi-dev \
        libssl-dev; \
    pip3 install --no-cache-dir --upgrade pip; \
    pip3 install --no-cache-dir codex-cli; \
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
    apt-get purge -y build-essential python3-dev pkg-config; \
    apt-get autoremove -y; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

COPY rootfs/ /

RUN chmod +x /etc/services.d/codex/run /etc/cont-init.d/10-log-level
