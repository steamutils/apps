#!/bin/bash
source ./.enshrouded
podman volume exists proton-$STEAMCMD_APPID || proton volume create proton-$STEAMCMD_APPID
podman volume exists steamapp-$STEAMCMD_APPID || proton volume create steamapp-$STEAMCMD_APPID

podman run -d --name $APP_NAME \
	-e STEAMCMD_ARGS='+@sSteamCmdForcePlatformType windows +force_install_dir /steamapp +login anonymous +app_update 2278520 -public validate +quit'
	-v steamapp-$STEAMCMD_APPID:/steamapp:z \
	-v proton-$STEAMCMD_APPID:/proton:z \
	-v ./enshrouded_server.json:/steamapp/enshrouded_server.json:z \
	-p 15636:15636/udp \
	-p 15637:15637/udp \
	quay.io/steamutils/proton-runner:latest \
	$EXECUTABLE_PATH
sleep 5
podman logs $APP_NAME
