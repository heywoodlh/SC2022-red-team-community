#!/usr/bin/env bash

pacman -Sy --noconfirm docker sudo

systemctl enable --now docker.service

useradd -m -s /bin/bash vulnerable \
    && echo 'vulnerable:vulnerable' | chpasswd \
    && usermod -aG docker vulnerable \
    && echo 'vulnerable ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vulnerable \
    && echo 'source ~/.bash_profile' > /home/vulnerable/.bashrc \
    && echo 'docker exec -it vulnerable bash' > /home/vulnerable/.bash_profile

echo 'root:vulnerable' | chpasswd

docker ps -a | grep -q vulnerable || \
    docker run -d --restart=unless-stopped --name=vulnerable \
    -p 21:21 \
    -p 22:22 \
    -p 80:80 \
    -p 445:445 \
    -p 631:631 \
    -p 3000:3000 \
    -p 3500:3500 \
    -p 6697:6697 \
    -p 3306:3306 \
    -p 8181:8181 \
    heywoodlh/sc-vulnerable
