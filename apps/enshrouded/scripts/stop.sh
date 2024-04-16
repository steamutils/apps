#!/bin/bash
source ./.enshrouded
podman kill -s SIGINT $APP_NAME
