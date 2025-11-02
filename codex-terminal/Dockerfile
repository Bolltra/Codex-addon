ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV LANG=C.UTF-8 \
    S6_KEEP_ENV=1

RUN set -eux; \
    if [ -f /defaults/etc/apk/repositories ]; then \
        cp /defaults/etc/apk/repositories /etc/apk/repositories; \
    fi; \
    success=0; \
    if [ -f /etc/apk/repositories ]; then \
        echo "Trying default repositories"; \
        if apk update; then \
            success=1; \
        fi; \
    fi; \
    if [ $success -ne 1 ]; then \
        echo "Switching to fallback mirrors"; \
        mirrors='https://dl-cdn.alpinelinux.org https://dl-2.alpinelinux.org https://dl-3.alpinelinux.org https://mirror.leaseweb.com/alpine https://mirror1.hs-esslingen.de/pub/Mirrors/alpine'; \
        for mirror in $mirrors; do \
            echo "$mirror/alpine/v3.19/main" > /etc/apk/repositories; \
            echo "$mirror/alpine/v3.19/community" >> /etc/apk/repositories; \
            if apk update; then \
                success=1; \
                break; \
            fi; \
            echo "Mirror $mirror failed, trying next..." >&2; \
            sleep 2; \
        done; \
    fi; \
    if [ $success -ne 1 ]; then \
        echo "All attempts to reach Alpine repositories failed" >&2; \
        exit 1; \
    fi; \
    apk add --no-cache \
        bash \
        curl \
        git \
        python3 \
        python3-dev \
        py3-virtualenv \
        py3-wheel \
        py3-psutil \
        py3-requests \
        npm \
        nodejs \
        busybox-extras \
        tzdata \
        sudo \
        sqlite \
        sqlite-dev \
        build-base \
        linux-headers \
        libffi-dev \
        openssl-dev \
        zlib-dev \
        bzip2-dev \
        readline-dev \
        libxml2-dev \
        libxslt-dev \
        libjpeg-turbo-dev \
        freetype-dev \
        ca-certificates \
        openssh \
        yq \
        jq \
        ttyd; \
    npm cache clean --force; \
    pip3 install --no-cache-dir --upgrade pip; \
    pip3 install --no-cache-dir codex-cli

COPY rootfs/ /

RUN chmod +x /etc/services.d/codex/run /etc/cont-init.d/10-log-level
