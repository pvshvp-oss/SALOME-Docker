#!/usr/bin/env sh

mkdir -p ~/salome

xhost +local:root \
    && docker run \
        --net=host \
        --ipc=host \
        --pid=host \
        --privileged=true \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --volume ~/salome:/home/salome \
        --env DISPLAY=${DISPLAY} \
        --interactive \
        --tty \
        --rm \
        shivanandvp/salome:9.9.0

xhost -local:root
