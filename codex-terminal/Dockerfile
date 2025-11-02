ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV LANG=C.UTF-8 \
    S6_KEEP_ENV=1

RUN apk update \
    && apk add --no-cache \
        bash \
        curl \
        git \
        python3 \
        py3-pip \
        ttyd \
    && apk add --no-cache gcc musl-dev python3-dev \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir codex-cli \
    && apk del gcc musl-dev python3-dev \
    && rm -rf /var/cache/apk/*

COPY rootfs/ /

RUN chmod +x /etc/services.d/codex/run /etc/cont-init.d/10-log-level
