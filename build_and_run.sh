#!/usr/bin/env sh

docker build -t salome-9.9.0 .\
    && docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
        --net=host \
        --ipc=host \
        --pid=host \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --privileged=true \
        salome-9.9.0
