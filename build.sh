#!/usr/bin/env bash

set -Eeuxo pipefail

docker rmi minecraft-forge-server:1.16.5-36.1.0 || true
docker rmi chunk-pregenerator:1.16-3.0.5 || true
docker rmi curseforge-downloader:latest || true
docker rmi minecraft-server:1.16.5 || true

pushd minecraft-server
docker build --force-rm -t minecraft-server:1.16.5 .
popd

pushd curseforge-downloader
docker build --force-rm -t curseforge-downloader:latest .
popd

pushd chunk-pregenerator
docker build --force-rm -t chunk-pregenerator:1.16-3.0.5 .
popd

pushd minecraft-forge-server
docker build --force-rm -t minecraft-forge-server:1.16.5-36.1.0 .
popd
