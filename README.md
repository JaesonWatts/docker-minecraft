# docker-minecraft

This repository defines several Docker images used to host Minecraft servers.
Deployers may bring their own configurations, worlds, and modpacks through the use of volumes (preferred) or bind mounts.

# Installation

Run the `build.sh` script included with this repository create Docker images for:

- the latest official Minecraft server

- the latest recommended Minecraft Forge server (includes the Chunk Pregenerator mod)

- the latest Shivaxi RLCraft server modpack (requires additional configuration)

# Deployment

Start a container using a command similar to the following:

```sh
docker run -d -p 25565:25565 --name minecraft --restart unless-stopped \
    -v minecraft:/server/data minecraft-forge-server:1.16.5-36.1.0
```

# Contributing

This project uses [GitHub Flow](https://githubflow.github.io/) except that the always-deployable branch is `main`.

This project follows the [angular.js Git Commit Guidelines](https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#-git-commit-guidelines).
