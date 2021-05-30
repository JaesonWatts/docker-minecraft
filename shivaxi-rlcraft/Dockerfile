ARG MINECRAFT_FORGE_VERSION=1.12.2-14.23.5.2855
ARG SHIVAXI_RLCRAFT_VERSION=2.8.2
ARG SHIVAXI_RLCRAFT_URL=https://media.forgecdn.net/files/2935/323/RLCraft+Server+Pack+1.12.2+-+Beta+v2.8.2.zip

FROM curseforge-downloader:latest AS shivaxi-rlcraft-modpack

ARG SHIVAXI_RLCRAFT_URL
ENV SHIVAXI_RLCRAFT_URL ${SHIVAXI_RLCRAFT_URL}

RUN set -eux; \
    curseforge-curl -o rlcraft.zip "${SHIVAXI_RLCRAFT_URL}"; \
    unzip rlcraft.zip; \
    rm rlcraft.zip

FROM minecraft-forge-server:${MINECRAFT_FORGE_VERSION}

ARG MINECRAFT_FORGE_VERSION
ENV MINECRAFT_FORGE_VERSION ${MINECRAFT_FORGE_VERSION}
LABEL minecraft_forge_version=${MINECRAFT_FORGE_VERSION}

ARG SHIVAXI_RLCRAFT_VERSION
ENV SHIVAXI_RLCRAFT_VERSION ${SHIVAXI_RLCRAFT_VERSION}
LABEL shivaxi_rlcraft_version=${SHIVAXI_RLCRAFT_VERSION}

COPY --chown=app:app --from=shivaxi-rlcraft-modpack /curseforge/ /server/data/
