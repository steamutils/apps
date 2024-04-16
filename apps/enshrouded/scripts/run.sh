#!/bin/bash
source ./.enshrouded

podman run -d --name $APP_NAME \
	-v steamapp-$STEAMCMD_APPID:/steamapp:z \
	-v proton-$STEAMCMD_APPID:/proton:z \
	-v ./enshrouded_server.json:/steamapp/enshrouded_server.json:z \
	-p 15636:15636/udp \
	-p 15637:15637/udp \
	quay.io/steamutils/proton-runner:latest \
	/steamapp/$EXECUTABLE_PATH
sleep 5
podman logs $APP_NAME
