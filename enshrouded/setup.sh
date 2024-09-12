#!/bin/env bash

mkdir -p $HOME/.config/containers/systemd/enshrouded

curl -sLJ https://raw.githubusercontent.com/steamutils/apps/main/enshrouded/deployment.yml >$HOME/.config/containers/systemd/enshrouded/deployment.yaml
curl -sLJ https://raw.githubusercontent.com/steamutils/apps/main/enshrouded/enshrouded.kube >$HOME/.config/containers/systemd/enshrouded.kube

echo "Starting enshrouded through systemd podman quadlet"
systemctl --user daemon-reload
systemctl --user start enshrouded

echo "Now enabling loginctl for unprivileged auto-start on boot"
sudo loginctl enable-linger

echo "Wait for pod to run..."
sleep 5

echo -e "\nPod running. Check process logs with: \n\npodman logs -f enshrouded-pod-server"
echo -e "Server Config file is located in $HOME/.config/containers/systemd/enshrouded/deployment.yml"
