ARG OPENJDK_VERSION=8

FROM openjdk:${OPENJDK_VERSION}

ARG OPENJDK_VERSION
ENV OPENJDK_VERSION ${OPENJDK_VERSION}

ARG MINECRAFT_VERSION
ENV MINECRAFT_VERSION ${MINECRAFT_VERSION:-1.16.5}
LABEL minecraft_version=${MINECRAFT_VERSION}

ARG MINECRAFT_SERVER_JAR
ENV MINECRAFT_SERVER_JAR ${MINECRAFT_SERVER_JAR:-https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar}

RUN set -eux; \
    adduser --system --group app; \
    mkdir -p /server/data/mods; \
    chown -R app:app /server
WORKDIR /server
USER app

RUN set -eux; \
    wget "${MINECRAFT_SERVER_JAR}" -O server.jar
COPY --chown=app:app ./start.sh /server/

VOLUME /server/data
WORKDIR /server/data
EXPOSE 25565
ENTRYPOINT ["/server/start.sh"]
