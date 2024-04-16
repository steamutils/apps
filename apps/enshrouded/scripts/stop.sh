#!/bin/bash
source ./.enshrouded
echo "$(podman kill -s SIGINT $APP_NAME) stopped."
echo "$(podman rm -f $APP_NAME) removed."
