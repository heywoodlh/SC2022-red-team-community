## Vulnerable Lab Environment

### Prerequisites:

1. [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git), [Docker](https://docs.docker.com/engine/install/) (preferably Docker Desktop) and [Docker-Compose](https://docs.docker.com/compose/install/) are installed and ready to use on your machine
2. A remote desktop client. Microsoft Remote Desktop is available for Windows and MacOS. Remmina is available for Linux.
3. Around 5GB of hard drive space for the container images. The container images have a lot preinstalled so as to allow you to get to playing with the environment ASAP. 

### Installation:

Use the following commands to setup and run the environment:

```
git clone https://github.com/heywoodlh/SC2022-red-team-community

cd SC2022-red-team-community/docker

docker-compose up
```

The container images are fairly large, so give them time to pull.

When the containers are up there should be the following resources available:

1. An internal Docker network at 172.30.30.0/24 for the containers to use

2. An `attacker` Docker container with an IP of 172.30.30.50 for you to run attacks against the target container. 

3. A `vulnerable` Docker container with an IP of 172.30.30.10 for you to exploit.

### Accessing the environment:

Access the `attacker` Docker container with a remote desktop client using the following information:

```
IP Address: 127.0.0.1:3389

Username: attacker
Password: attacker
```
