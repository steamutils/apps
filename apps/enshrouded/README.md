# Enshrouded Dedicated Server

Guide on standing up your own Enshrouded Dedicated Server

Ready-made materials are located in `scripts` if you prefer docker/podman method, or `manifests` if you prefer kubernetes deployment API and like to use kubernetes/kubectl/oc/podman kube play.

---
### Podman or Docker

Create Volumes for your steamapp, and optionally your proton-prefix volume which will hold the bottle/data from proton. Proton will automatically generate a new bottle if you decide you never want to persist data in a volume, though, so if you want to skip the proton volume go ahead. It will just rebuild the bottle on every run in ephemeral container storage.
```
podman volume exists steamapp-2278520 || podman volume create steamapp-2278520
podman volume exists proton-2278520 || podman volume create proton-2278520
```

Run the `quay.io/steamutils/steamcmd` container to install your application into your steamapp volume for re-use.
Clean up the leftover container once done.
```
podman run -it --name steamcmd-appinstaller-2278520 \
	-e STEAMCMD_APPID=2278520 \
	-e STEAMCMD_APP_BRANCH=-public \
	-v steamapp-2278520:/steamapp:z \
	quay.io/steamutils/steamcmd:latest \
	+@sSteamCmdForcePlatformType windows +force_install_dir /steamapp +login anonymous +app_update 2278520 -public validate +quit

podman rm -f steamcmd-appinstaller-2278520
```

Configure your dedicated server in `enshrouded_server.json`
For the most part, you can just change your `name` and `password` on this config. The `savegame` and `logs` are saved in the steamapp volume you created earlier.
```
{
        "name": "Enshrouded Server",
        "password": "",
        "saveDirectory": "./savegame",
        "logDirectory": "./logs",
        "ip": "0.0.0.0",
        "gamePort": 15636,
        "queryPort": 15637,
        "slotCount": 16
}
```

Run your dedicated server.
```
podman run -d --name enshrouded-dedicated-server \
	-v steamapp-2278520:/steamapp:z \
	-v proton-2278520:/proton:z \
	-v ./enshrouded_server.json:/steamapp/enshrouded_server.json:z \
	-p 15636:15636/udp \
	-p 15637:15637/udp \
	quay.io/steamutils/proton-runner:latest \
	/steamapp/enshrouded_server.exe
```

---

### Podman-Kube-Play
In this repository there are files under `manifests/` that contains `install.yaml` and `run.yaml` files. You can use these to declaratively compose just like `docker-compose`.

#### Installing
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

#### Running 
Run the deployment of the dedicated server

```
podman kube play run.yaml
```

Verify it's running by tailing the logs
```
podman logs -f enshrouded-dedicated-server-pod-enshrouded
```

