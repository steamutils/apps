# Enshrouded Dedicated Server

## Podman-Kube-Play
Requires:
- Podman

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
