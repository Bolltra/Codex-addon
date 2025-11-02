ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV LANG=C.UTF-8 \
    S6_KEEP_ENV=1

RUN apk add --no-cache \
        bash \
        curl \
        git \
        python3 \
        py3-pip \
        ttyd \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir codex-cli

COPY rootfs/ /

RUN chmod +x /etc/services.d/codex/run /etc/cont-init.d/10-log-level
