# squeak-vnc-supervisor

_This repo is forked from [mumez/pharo-vnc-supervisor](https://github.com/mumez/pharo-vnc-supervisor "pharo-vnc-supervisor")_

A Docker image for [Squeak Smalltalk 5.2b](https://squeak.org/ "Squeak"). Especially suitable for web application development and delivery.

- Squeak process is daemonized by supervisord.
- Debuggable via VNC.
- Web browsers (Firefox and Chronium) are installed.

# Quick Start

```bash
docker run --name my_squeak -d -p 5901:5901 -p 6901:6901 adann0/squeak-vnc-supervisor
```

You can access the running squeak image via VNC client or web browser.
(the default password is 'vncpassword')

- VNC client:  `yourhost:5901`
- Web browser: `http://yourhost:6901/?password=vncpassword`

## How to start with a customized Squeak image

1. Place your customized Squeak image to your docker-host data directory (For example, `/home/$USER/squeak`).
2. Use `docker run` `-v` option to mount the data direcotry.

```bash
docker run --name my_squeak -d -p 5901:5901 -p 6901:6901 \
	-v /home/$USER/squeak:/squeak \
	adann0/squeak-vnc-supervisor
```

## Squeak related environment variables

```bash
SQUEAK_SUPERVISOR_LOG_NAME=squeak-supervisord.log
SQUEAK_IMAGE=Squeak5.2-*.image
SQUEAK_START_SCRIPT=
```

## VNC related environment variables

Please see [ubuntu-icewm-vnc](https://hub.docker.com/r/consol/ubuntu-icewm-vnc/).

# ToDo :

Push l'image sur DockerHub + Une version headless sans VNC et compatible Armv7
