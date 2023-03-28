FROM ubuntu:jammy

RUN apt update && apt full-upgrade -y && apt install -y curl
COPY SALOME-9.10.0.tar.gz /opt/SALOME-9.10.0.tar.gz
RUN tar -C /opt -xf /opt/SALOME-9.10.0.tar.gz --totals && rm /opt/SALOME-9.10.0.tar.gz

RUN apt update && DEBIAN_FRONTEND=noninteractive TZ="America/Chicago" apt install -y python3 libopengl0 libglu1 libfontconfig1 libsm6 dbus-x11 libglib2.0-dev libpangoft2-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libpango1.0-dev libegl1 xterm netcat

RUN chmod 755 /opt/SALOME-9.10.0/env_launch.sh /opt/SALOME-9.10.0/salome /opt/SALOME-9.10.0/mesa_salome
RUN ln -s /opt/SALOME-9.10.0/salome /usr/bin/salome
RUN ln -s /opt/SALOME-9.10.0/mesa_salome /usr/bin/mesa_salome
WORKDIR /home/salome
SHELL ["/bin/bash", "-c"]
CMD mesa_salome & \
    . /opt/SALOME-9.10.0/env_launch.sh && /bin/bash
