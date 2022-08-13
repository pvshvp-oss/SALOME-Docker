#!/usr/bin/env sh

xhost +local:root \
    && docker run \
        --net=host \
        --ipc=host \
        --pid=host \
        --privileged=true \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --env DISPLAY=${DISPLAY} \
        --interactive \
        --tty \
        --rm \
        salome:9.9.0

xhost -local:root
