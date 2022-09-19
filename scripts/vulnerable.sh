#!/usr/bin/env bash

# If Arch Linux
if grep -q 'Arch Linux' /etc/os-release
then
        pacman -Syu --noconfirm docker docker-compose git
fi

# If Debian-based
if [[ -e /etc/debian_version ]]
then
        apt-get update 
        apt-get install -y docker.io docker-compose git
fi

# Start docker service
systemctl enable docker.service
systemctl start docker.service

# Clone the repository and bring up the containers
rm -rf /opt/SC2022-red-team-community
git clone https://github.com/heywoodlh/SC2022-red-team-community /opt/SC2022-red-team-community
cp -f /opt/SC2022-red-team-community/docker/docker-compose.yml-system /opt/SC2022-red-team-community/docker/docker-compose.yml
cd /opt/SC2022-red-team-community/docker && docker-compose up -d 
