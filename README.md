# Steam Apps

Opinionated containerized steam apps for running dedicated servers. Uses podman, podman quadlet, and systemd.

This repository contains copy-paste quick start one-line commands that can bootstrap a dedicated server on any linux distro that has podman and systemd installed.

## Requirements

- [podman](https://podman.io/docs/installation)
- systemd
- podman quadlet (included in podman 4.4+)

> **_NOTE:_** These containers run in unprivileged/rootless podman. If you are on a distro that does not configure this out of the box (such as Arch/Manjaro) follow the podman installation docs for more information on setting up [rootless podman](https://github.com/containers/podman/blob/main/README.md#rootless)

## Applications

-----
#### [Enshrouded Dedicated Server](enshrouded)
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/steamutils/apps/main/enshrouded/setup.sh)"
```
-----
#### [Satisfactory Dedicated Server](satisfactory)
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/steamutils/apps/main/satisfactory/setup.sh)"
```
-----
