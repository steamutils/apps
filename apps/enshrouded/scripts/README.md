# Enshrouded Dedicated Server

Guide on running the enshrouded dedicated server with just `docker run` or `podman run`

Materials in this folder are already prepared to install and start the server.

# Steps

- Edit your `enshrouded_server.json` file to configure your server as desired.
- Modify `run.sh` as desired, to add mount points such as `./savegame` if you are migrating your savegame.
- Run `run.sh` to start the server. 
