FROM kalilinux/kali-rolling

## Essentials for getting XRDP and SSH going
RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends \
        dbus-x11 \
        firefox-esr \
        git \
        locales \
        sudo \
        x11-xserver-utils \
        xfce4 \
        xfce4-goodies \
	fonts-dejavu \
        xorgxrdp \
        xrdp \
	iproute2 \
	dnsutils \
	openssh-server \
	supervisor

## Install some Kali essentials
RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends \
        kali-linux-headless \
        amap \
        dnswalk \
        medusa \
        ndiff \
        man \
        padbuster \
        webscarab \
        yersinia \
        bash-completion \
        neofetch \
	iputils-ping \
	kali-community-wallpapers

## Juiceshop dependencies
RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends \
	burpsuite

## SSH setup
RUN sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g' /etc/ssh/sshd_config
RUN echo 'AuthorizedKeysFile ~/.ssh/authorized_keys' >> /etc/ssh/sshd_config
RUN mkdir -p /run/sshd

## Cleanup
RUN apt-get autoremove -y &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

ENV LANG en_US.UTF-8

COPY bashrc /etc/bashrc
COPY startup /startup
COPY xfce4.tar.gz /opt/xfce4.tar.gz
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22/tcp
EXPOSE 3389/tcp
ENTRYPOINT ["/usr/bin/supervisord", "--configuration", "/etc/supervisor/conf.d/supervisord.conf"]
