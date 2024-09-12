#!/bin/env bash

mkdir -p $HOME/.config/containers/systemd/satisfactory

curl -sLJ https://raw.githubusercontent.com/steamutils/apps/main/satisfactory/deployment.yml >$HOME/.config/containers/systemd/satisfactory/deployment.yaml
curl -sLJ https://raw.githubusercontent.com/steamutils/apps/main/satisfactory/satisfactory.kube >$HOME/.config/containers/systemd/satisfactory.kube

echo "Starting satisfactory through systemd podman quadlet"
systemctl --user daemon-reload
systemctl --user start satisfactory
systemctl --user status satisfactory

echo "Now enabling loginctl for unprivileged auto-start on boot"
sudo loginctl enable-linger

echo "Wait for pod to run..."
sleep 5

echo "Tailing pod logs, Ctrl+C at any time to stop watching logs."
podman logs -f satisfactory-pod-factoryserver
