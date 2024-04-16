#!/bin/bash
podman run -it --name debug-$STEAMCMD_APPID --entrypoint /bin/bash \
	-v steamapp-$STEAMCMD_APPID:/steamapp:z \
	-v proton-$STEAMCMD_APPID:/proton:z \
	-v ./enshrouded_server.json:/steamapp/enshrouded_server.json:z \
	-p 15636:15636/udp \
	-p 15637:15637/udp \
	quay.io/steamutils/proton-runner:latest
sleep 5
podman rm -f debug-$STEAMCMD_APPID
