ARG CHUNK_PREGENERATOR_VERSION=1.16-3.0.5
ARG MINECRAFT_VERSION=1.16.5

FROM chunk-pregenerator:${CHUNK_PREGENERATOR_VERSION} AS chunk-pregenerator-mod

FROM minecraft-server:${MINECRAFT_VERSION}

ARG MINECRAFT_VERSION
ENV MINECRAFT_VERSION ${MINECRAFT_VERSION}
LABEL minecraft_version=${MINECRAFT_VERSION}

ARG MINECRAFT_FORGE_VERSION
ENV MINECRAFT_FORGE_VERSION ${MINECRAFT_FORGE_VERSION:-1.16.5-36.1.0}
LABEL minecraft_forge_version=${MINECRAFT_FORGE_VERSION}

ARG CHUNK_PREGENERATOR_VERSION
ENV CHUNK_PREGENERATOR_VERSION ${CHUNK_PREGENERATOR_VERSION}
LABEL chunk_pregenerator_version=${CHUNK_PREGENERATOR_VERSION}

WORKDIR /server
RUN set -eux; \
    wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/${MINECRAFT_FORGE_VERSION}/forge-${MINECRAFT_FORGE_VERSION}-installer.jar -O forge-installer.jar; \
    java -jar forge-installer.jar --installServer; \
    rm forge-installer.jar forge-installer.jar.log minecraft_server*.jar; \
    mv forge-*.jar server.jar

# Install the Chunk Pregenerator mod.
COPY --chown=app:app --from=chunk-pregenerator-mod /curseforge/Chunk+Pregenerator-V${CHUNK_PREGENERATOR_VERSION}.jar /server/data/mods/

WORKDIR /server/data
