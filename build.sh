#!/usr/bin/env sh

SALOME_DIRNAME="SALOME-9.10.0"

ls "$SALOME_DIRNAME.tar.gz" >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
   >&2 echo "ERROR: Cannot find the SALOME Linux Universal Binaries archive file."
   >&2 echo "Please copy the SALOME Linux Universal Binaries archive file, and rename it as $SALOME_DIRNAME.tar.gz in the salome-docker directory..."
   exit 1
fi

docker build \
    --network host \
    --platform linux/amd64 \
    --tag shivanandvp/salome:9.10.0 \
    --tag shivanandvp/salome:latest \
    . \
    "$@"
