#!/usr/bin/env bash

set -Eeuxo pipefail

pushd minecraft-server
docker build --force-rm -t minecraft-server:1.16.5 .
popd

pushd curseforge-downloader
docker build --force-rm -t curseforge-downloader:latest .
popd

pushd minecraft-forge-server
docker build --force-rm -t minecraft-forge-server:1.16.5-36.1.0 .
popd
