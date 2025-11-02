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
    && apk add --no-cache --virtual .build-deps \
        build-base \
        python3-dev \
        jpeg-dev \
        zlib-dev \
        freetype-dev \
        lcms2-dev \
        openjpeg-dev \
        tiff-dev \
        libpng-dev \
        libwebp-dev \
        libffi-dev \
        openssl-dev \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir codex-cli \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

COPY rootfs/ /

RUN chmod +x /etc/services.d/codex/run /etc/cont-init.d/10-log-level
