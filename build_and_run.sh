#!/usr/bin/env sh

docker build -t salome .\
    && xhost +local:root \
    && docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
        --net=host \
        --ipc=host \
        --pid=host \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --privileged=true \
        salome

xhost -local:root