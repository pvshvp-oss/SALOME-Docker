FROM ubuntu:jammy

ARG SALOME_VERSION=9.12.0
RUN apt update && apt full-upgrade -y && apt install -y curl
COPY SALOME-$SALOME_VERSION.tar.gz /opt/SALOME-$SALOME_VERSION.tar.gz
RUN tar -C /opt -xf /opt/SALOME-$SALOME_VERSION.tar.gz --totals && rm /opt/SALOME-$SALOME_VERSION.tar.gz

# Dependencies obtained by running (in the SALOME directory) /opt/SALOME-9.12.0/sat/sat config SALOME-9.12.0 --check_system
RUN DEBIAN_FRONTEND=noninteractive apt install -y \
    python3 xterm dbus libbsd0 libbz2-1.0 libc6 libdrm2 libegl1 libexif12 libexpat1 libfftw3-double3 libfontconfig1 libgl1 libglu1-mesa libgomp1 libgphoto2-6 libice6 libjbig0 libltdl7 liblzma5 libncurses5 libnuma1 libpcre3 libquadmath0 libraw1394-11 libsm6 libstdc++6 libtiff5 libudev1 libusb-1.0-0 libuuid1 libx11-6 libx11-xcb1 libxau6 libxcb1 libxcb-glx0 libxcb-xfixes0 libxcb-xkb1 libxdmcp6 libxext6 libxft2 libxi6 libxkbcommon0 libxkbcommon-x11-0 libxmu6 libxpm4 libxrender1 libxss1 libxt6 zlib1g libsqlite3-0

RUN dbus-uuidgen > /etc/machine-id \
    && mkdir -p /var/run/dbus \
    && dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address \
    && chmod 755 /opt/SALOME-$SALOME_VERSION/env_launch.sh /opt/SALOME-$SALOME_VERSION/salome /opt/SALOME-$SALOME_VERSION/mesa_salome \
    && ln -s /opt/SALOME-$SALOME_VERSION/salome /usr/bin/salome \
    && ln -s /opt/SALOME-$SALOME_VERSION/mesa_salome /usr/bin/mesa_salome

WORKDIR /home/salome
SHELL ["/bin/bash", "-c"]
CMD mesa_salome & \
    . /opt/SALOME-9.12.0/env_launch.sh && /bin/bash
