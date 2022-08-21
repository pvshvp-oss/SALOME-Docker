# SALOME-Docker

A Docker Container to run SALOME (from https://www.salome-platform.org/).

The docker image is uploaded at https://hub.docker.com/r/shivanandvp/salome

The `build.sh`, `run.sh`, and `build_and_run.sh` scripts are self explanatory. They build an image and run the container using the local `Dockerfile`.

## Using the image from Docker Hub

> **Note:** The container is already configured to additionally start a shell in the `/home/salome` directory (within the container) while simultaneously launching the Salome graphical application.

To run this container while mounting a custom local directory `~/salome` (on your host computer) for use as `/home/salome` (within the container), it is convenient to make an executable script that has the following contents:
```sh
#!/usr/bin/env sh

docker pull shivanandvp/salome:9.9.0
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
        salome:9.9.0

xhost -local:root
```
Otherwise just run the above commands in the same order, without the `#!` line

