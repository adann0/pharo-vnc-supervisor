# squeak-vnc-supervisor

_This repo is forked from [mumez/pharo-vnc-supervisor](https://github.com/mumez/pharo-vnc-supervisor "pharo-vnc-supervisor")_

A Docker image for [Squeak Smalltalk 5.2b](https://squeak.org/ "Squeak"). Especially suitable for web application development and delivery.

- Squeak process is daemonized by supervisord.
- Debuggable via VNC.
- Web browsers (Firefox and Chronium) are installed.

## Usages

```bash
docker run --name my_squeak -d -p 5901:5901 -p 6901:6901 adann0/squeak-vnc-supervisor:amd64
```

You can access the running squeak image via VNC client or web browser.
(the default password is 'vncpassword')

- VNC client:  `yourhost:5901`
- Web browser: `http://yourhost:6901/?password=vncpassword`

### How to start with a customized Squeak image

1. Place your customized Squeak image to your docker-host data directory (For example, `/home/$USER/squeak`).
2. Use `docker run` `-v` option to mount the data direcotry.

```bash
docker run --name my_squeak -d -p 5901:5901 -p 6901:6901 \
	-v /home/$USER/squeak:/squeak \
	adann0/squeak-vnc-supervisor:amd64
```

### Squeak related environment variables

```bash
SQUEAK_SUPERVISOR_LOG_NAME=squeak-supervisord.log
SQUEAK_IMAGE=Squeak5.2-*.image
SQUEAK_START_SCRIPT=
```

### VNC related environment variables

Please see [ubuntu-icewm-vnc](https://hub.docker.com/r/consol/ubuntu-icewm-vnc/).

## For Armv7

```bash
git clone https://github.com/ConSol/docker-headless-vnc-container.git &&
cd docker-headless-vnc-container &&
sed -i '3s/ubuntu:16.04/arm32v7\/ubuntu:18.04/1' Dockerfile.ubuntu.icewm.vnc &&
docker build -t "ubuntu-icewm-vnc:armv7" -f Dockerfile.ubuntu.icewm.vnc .

git clone https://github.com/adann0/squeak-vnc-supervisor &&
cd squeak-vnc-supervisor &&
docker build -t "squeak-vnc-supervisor:armv7" -f Dockerfile.armv7 .
```

## ToDo :

Without VNC Version (?) and Arm version ; un manifeste pour pull l'image sans l'architecture
