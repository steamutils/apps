# Enshrouded Dedicated Server

## Requirements

- [podman](https://podman.io/docs/installation)
- systemd
- podman quadlet (included in podman 4.4+)

> **_NOTE:_** These containers run in unprivileged/rootless podman. If you are on a distro that does not configure this out of the box (such as Arch/Manjaro) follow the podman installation docs for more information on setting up [rootless podman](https://github.com/containers/podman/blob/main/README.md#rootless)

## Quick Start
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/steamutils/apps/main/enshrouded/setup.sh)"
```

## Editing Server Config

The server config is located in `$HOME/.config/containers/systemd/enshrouded/deployment.yaml` in the form of a configmap definition. systemd will have podman kube play generate the volume based on this configmap yaml at runtime. When you want to change server settings, you can just modify that config file.

## Management

Stopping 

```
systemctl --user stop enshrouded
```

Starting
```
systemctl --user start enshrouded
```


Checking Logs
```
podman logs -f enshrouded-pod-server
```
