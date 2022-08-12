FROM ubuntu:focal

RUN apt update && apt full-upgrade -y

RUN apt install curl -y
RUN curl https://files.salome-platform.org/Salome/Salome9.9.0/SALOME-9.9.0.tar.gz --output /opt/SALOME-9.9.0.tar.gz
RUN tar -xvf /opt/SALOME-9.9.0.tar.gz -C /opt
RUN rm /opt/SALOME-9.9.0.tar.gz

RUN chmod 755 /opt/SALOME-9.9.0/env_launch.sh
RUN chmod 755 /opt/SALOME-9.9.0/salome
RUN chmod 755 /opt/SALOME-9.9.0/mesa_salome
RUN ln -s /opt/SALOME-9.9.0/salome /usr/bin/salome
RUN ln -s /opt/SALOME-9.9.0/mesa_salome /usr/bin/mesa_salome
RUN apt install libopengl0 -y

CMD bash /opt/SALOME-9.9.0/env_launch.sh && mesa_salome && /bin/bash
