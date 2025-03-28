FROM debian:bookworm

SHELL ["/bin/bash", "-c"]
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y locales \
    procps sudo apt-utils

RUN sysctl net.ipv6.conf.all.disable_ipv6 && \
cd /tmp && \
wget https://repo.allstarlink.org/public/asl-apt-repos.deb12_all.deb && \
sudo dpkg -i asl-apt-repos.deb12_all.deb && \
sudo apt update && \
sudo apt install asl3

ENV LANG en_US.utf8