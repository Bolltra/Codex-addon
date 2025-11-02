ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV LANG=C.UTF-8 \
    S6_KEEP_ENV=1 \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
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
        libssl-dev \
        ttyd \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir codex-cli \
    && apt-get purge -y build-essential python3-dev pkg-config libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev libopenjp2-7-dev libtiff-dev libwebp-dev libpng-dev libxslt1-dev libffi-dev libssl-dev \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY rootfs/ /

RUN chmod +x /etc/services.d/codex/run /etc/cont-init.d/10-log-level
