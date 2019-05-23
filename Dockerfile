FROM consol/ubuntu-icewm-vnc

## Change to root
USER 0

## Squeak
ENV SQUEAK_VERSION=5.2
ENV SQUEAK_IMAGE=Squeak$SQUEAK_VERSION-18229-64bit
ENV SQUEAK_RELEASE=$SQUEAK_IMAGE-201810190412-Linux
ENV SQUEAK_IMAGE_LOCATION=shared/$SQUEAK_IMAGE.image
ENV SQUEAK_HOME=/squeak
ENV SQUEAK_START_SCRIPT=''

WORKDIR $SQUEAK_HOME

RUN apt-get update && apt-get install -y --no-install-recommends \
    supervisor \
    unzip \
  && wget http://files.squeak.org/$SQUEAK_VERSION/$SQUEAK_IMAGE/$SQUEAK_RELEASE.zip \
  && unzip $SQUEAK_RELEASE.zip \
  && mv $SQUEAK_RELEASE/* . \
  && apt-get remove -y \
    unzip \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf Squeak$SQUEAK_VERSION-*

ENV PATH="/squeak/bin:${PATH}"

# Setup scripts
ADD ./launch-squeak.sh /usr/local/bin/
ADD ./setup.sh /usr/local/bin/
ADD ./docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*

VOLUME [ /squeak/shared ]
EXPOSE 9000

# Supervisor
ENV SQUEAK_SUPERVISOR_LOG_NAME=squeak-supervisord.log
COPY squeak-supervisord.conf /etc/supervisor/conf.d/squeak-supervisord.conf

# Locale
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ARG TZ='Europe/Paris'
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["supervisord"]
