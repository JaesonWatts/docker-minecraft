ARG DEBIAN_VERSION=buster

FROM debian:${DEBIAN_VERSION}

ARG DEBIAN_VERSION
ENV DEBIAN_VERSION ${DEBIAN_VERSION}
LABEL debian_version=${DEBIAN_VERSION}

COPY curl-wrapper /usr/local/bin
RUN set -eux; \
    chmod 755 /usr/local/bin/curl-wrapper; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        unzip \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    useradd --system app; \
    mkdir -p /server; \
    chown -R app:app /server
WORKDIR /server
USER app
