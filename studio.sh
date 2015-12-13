#!/bin/bash

CMD="docker run \
       --rm \
       --name studio \
       --net "host" \
       --env DISPLAY=unix$DISPLAY \
       --user 1000:1000 \
       --volume /tmp/.X11-unix:/tmp/.X11-unix \
       --volume $HOME:/home/developer \
       kurron/docker-android-studio:latest"

echo $CMD
$CMD
