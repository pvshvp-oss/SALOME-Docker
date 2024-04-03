#!/usr/bin/env sh

mkdir -p ~/salome

xhost +local:root \
    && docker run \
        --net=host \
        --ipc=host \
        --pid=host \
        --privileged=true \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --mount type=bind,source="$HOME/salome",target="/home/salome" \
        --env DISPLAY=${DISPLAY} \
        --interactive \
        --tty \
        --rm \
        --name=SALOME \
        shivanandvp/salome:9.12.0

xhost -local:root
