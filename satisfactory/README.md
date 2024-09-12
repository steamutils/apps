# Satisfactory Dedicated Server

## Requirements

- [podman](https://podman.io/docs/installation)
- systemd
- podman quadlet (included in podman 4.4+)

> **_NOTE:_** These containers run in unprivileged/rootless podman. If you are on a distro that does not configure this out of the box (such as Arch/Manjaro) follow the podman installation docs for more information on setting up [rootless podman](https://github.com/containers/podman/blob/main/README.md#rootless)
## Quick Start
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/steamutils/apps/main/satisfactory/setup.sh)"
```


## Configuration

Satisfactory uses a certificate-signed claim-on-creation bootstrap process that allows the server administrator to handle almost all game/server/session configuration from within the game client itself.

Config *data* for the server is stored in the `satisfactory-data` podman volume, whereas the dedicated server application stays stored in `satisfactory-app`.

The wiki is not great at staying up to date, and at time of writing the server config data gets mounted inside the container at `$HOME/.config/Epic` since the server binary does not specify a flag for choosing where to write server and session data.

The app volume is mounted into `/steamapp` as usual.
