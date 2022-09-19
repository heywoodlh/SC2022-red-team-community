#!/usr/bin/env bash

[[ -z ${USER} ]] && export USER='attacker'
[[ -z ${PASSWORD} ]] && export PASSWORD='attacker'

# Create the user account
groupadd --gid 1020 ${USER}
useradd --shell /bin/bash --uid 1020 --gid 1020 --password $(openssl passwd ${PASSWORD}) --create-home --home-dir /home/${USER} ${USER}
echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER}

## Setup shell files
cp /etc/bashrc /home/${USER}/.bashrc
cp /etc/bashrc /root/.bashrc
touch /home/${USER}/.hushlogin
touch /root/.hushlogin

## Desktop settings
mkdir -p /home/${USER}/.config
tar -C /home/${USER}/.config -xf /opt/xfce4.tar.gz
chown -R ${USER} /home/${USER}/.config

## If /tmp/net-info.txt exists, copy it to the Desktop 
mkdir -p /home/${USER}/Desktop
[[ -e /tmp/net-info.txt ]] && cp /tmp/net-info.txt /home/${USER}/Desktop/net-info.txt && chown ${USER} /home/${USER}/Desktop/net-info.txt

