# Enshrouded Dedicated Server

Quick Start
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
