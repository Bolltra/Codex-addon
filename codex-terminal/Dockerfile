ARG BUILD_FROM
FROM ${BUILD_FROM}

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV LANG=C.UTF-8 \
    S6_KEEP_ENV=1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        git \
        python3 \
        python3-pip \
        ttyd \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir codex-cli \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY rootfs/ /

RUN chmod +x /etc/services.d/codex/run /etc/cont-init.d/10-log-level
