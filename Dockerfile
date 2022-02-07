# Nebra Helium Hotspot - BTLE Configuration Software Container
# (C) Nebra LTD. 2021
# Licensed under the MIT License.

####################################################################################################
################################## Stage: builder ##################################################

# The balenalib/raspberry-pi-debian-python image was tested but missed many dependencies.
FROM balenalib/raspberry-pi-debian-python:buster-run-20211014

RUN curl -1sLf "https://repositories.timber.io/public/vector/gpg.3543DB2D0A2BC4B8.key" | apt-key add - > /dev/null

RUN \
    echo 'deb https://repositories.timber.io/public/vector/deb/debian buster main' | tee -a /etc/apt/sources.list.d/timber-vector.list && \
    echo 'deb-src https://repositories.timber.io/public/vector/deb/debian buster main' | tee -a /etc/apt/sources.list.d/timber-vector.list

RUN install_packages \
    apt-transport-https \
    vector

COPY vector.toml /etc/vector/vector.toml
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
