# Enshrouded Dedicated Server

Guide on standing up your own Enshrouded Dedicated Server

---
### Podman or Docker

#### Installing
Run the `install.sh` bash script to automatically install the application into a volume
```
$ install.sh
```

#### Running
Run the `run.sh` bash script to automatically spin up a container with a fresh proton prefix volume and your newly installed steamapp volume mounted, with the ports 15636 and 15637 already published/exposed from the container
```
$ run.sh
```

**Optional:**
There are `troubleshoot.sh` and `stop.sh` scripts in here to assist with troubleshooting.

---

### Podman-Kube-Play/Kubernetes

#### Installing
Run the `install.yaml` deployment by either 
```
kubectl create -f install.yaml
```

or with podman:
```
podman kube play install.yaml
```

tail the logs of the pod, and when it is done installing the application, you can remove the deployment.

```
kubectl logs -f $(kubectl get pod)

podman logs -f $(podman ps -a -f name=steamapp --format json | jq -r '.[].Names[]')
```

```
kubectl delete deployment/steamapp-2278520

podman kube down install.yaml
```

#### Running 
Run the `run.yaml` deployment

```
kubectl create -f run.yaml

podman kube play run.yaml
```
