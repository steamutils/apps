# Enshrouded Dedicated Server

## Podman-Kube-Play
Requires:
- Podman

### Installing
Run the deployment for the installer
```
podman kube play install.yaml
```

tail the logs of the pod, and when it is done installing the application, you can remove the deployment.

```
podman logs -f $(podman ps -a -f name=steamapp --format json | jq -r '.[].Names[]')
```

When you're done watching it install
```
podman kube down install.yaml
```

### Running 
Configure your server at `enshrouded_server.json`.

Run the deployment of the dedicated server

```
podman kube play run.yaml
```

Verify it's running by tailing the logs
```
podman logs -f enshrouded-dedicated-server-pod-enshrouded
```

### Updating

Shut down the server
```
podman kube down run.yaml
```

Run the installer again
```
podman kube play install.yaml
```

When it's done, you can `podman kube down` the installer and `play` the run.yaml again.