# Enshrouded Dedicated Server

Guides on standing up your own Enshrouded Dedicated Server

## Guides

## Normal (Docker and Podman)

If you don't have podman, just replace the word `podman` in these scripts to `docker`

# Steps

- Edit your `enshrouded_server.json` file to configure your server as desired.
- Modify `podman-proton.sh` as desired, to add mount points such as `./savegame` if you are migrating your savegame.
- Run `podman-proton.sh` to start the server. 

---
## Podman-Kube-Play
Requires:
- Podman

### Running 
Configure your server at `enshrouded_server.json`.

Run the deployment of the dedicated server

```
podman kube play proton.yaml
```

Verify it's running by tailing the logs
```
podman logs -f enshrouded
```

