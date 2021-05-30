ARG DEBIAN_VERSION=buster

FROM debian:${DEBIAN_VERSION}

ARG DEBIAN_VERSION
ENV DEBIAN_VERSION ${DEBIAN_VERSION}
LABEL debian_version=${DEBIAN_VERSION}

COPY curseforge-curl /usr/local/bin
RUN set -eux; \
    chmod 755 /usr/local/bin/curseforge-curl; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        unzip \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    adduser --system --group app; \
    mkdir -p /curseforge; \
    chown -R app:app /curseforge
WORKDIR /curseforge
USER app
