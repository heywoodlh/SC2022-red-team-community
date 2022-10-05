#!/usr/bin/env bash

# If Arch Linux, install docker
if grep -q 'Arch Linux' /etc/os-release
then
        pacman -Syu --noconfirm docker docker-compose git
fi

# If Debian-based, install docker
if [[ -e /etc/debian_version ]]
then
        apt-get update 
        apt-get install -y docker.io docker-compose git
fi

# Start docker service
systemctl enable docker.service
systemctl start docker.service

# If connected to the internet
if ping -c 1 github.com &>/dev/null
then
	# Bring down the existing containers if they exist
	[[ -d /opt/SC2022-red-team-community/docker ]] && cd /opt/SC2022-red-team-community/docker && docker-compose down
	cd 

	# Re-clone the repository so it's fresh/up-to-date
	git clone https://github.com/heywoodlh/SC2022-red-team-community /opt/SC2022-red-team-community.new 
	[[ -d /opt/SC2022-red-team-community.new ]] && rm -rf /opt/SC2022-red-team-community 
	[[ -d /opt/SC2022-red-team-community.new ]] && mv /opt/SC2022-red-team-community.new /opt/SC2022-red-team-community

	# Bring the containers back up
	cp -f /opt/SC2022-red-team-community/docker/docker-compose.yml-system /opt/SC2022-red-team-community/docker/docker-compose.yml
	cd /opt/SC2022-red-team-community/docker && docker-compose up -d 
fi
