#!/usr/bin/env bash

set -Eeuxo pipefail

pushd minecraft-server
docker build --force-rm -t minecraft-server:1.16.5 .
docker build --force-rm -t minecraft-server:1.12.2 \
       --build-arg MINECRAFT_VERSION=1.12.2 \
       --build-arg MINECRAFT_SERVER_JAR=https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar \
       .
popd

pushd curseforge-downloader
docker build --force-rm -t curseforge-downloader:latest .
popd

pushd minecraft-forge-server
docker build --force-rm -t minecraft-forge-server:1.16.5-36.1.0 .
docker build --force-rm -t minecraft-forge-server:1.12.2-14.23.5.2855 \
       --build-arg MINECRAFT_VERSION=1.12.2 \
       --build-arg MINECRAFT_FORGE_VERSION=1.12.2-14.23.5.2855 \
       --build-arg CHUNK_PREGENERATOR_VERSION=1.12-2.2 \
       --build-arg CHUNK_PREGENERATOR_URL=https://media.forgecdn.net/files/2811/832/Chunk+Pregenerator+V1.12-2.2.jar \
       .
popd

pushd shivaxi-rlcraft
docker build --force-rm -t shivaxi-rlcraft:2.8.2 .
popd
