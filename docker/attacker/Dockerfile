FROM kalilinux/kali-rolling

## Essentials for getting XRDP going
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
        xorgxrdp \
        xrdp \
	iproute2 \
	dnsutils \
	fonts-dejavu 

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
	kali-community-wallpapers

## Cleanup
RUN apt-get autoremove -y &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

ENV LANG en_US.UTF-8

COPY entrypoint.sh /usr/bin/entrypoint
COPY bashrc /etc/bashrc
COPY xfce4.tar.gz /opt/xfce4.tar.gz
EXPOSE 3389/tcp
ENTRYPOINT ["/usr/bin/entrypoint"]
