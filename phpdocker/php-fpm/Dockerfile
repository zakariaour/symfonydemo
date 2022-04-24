FROM phpdockerio/php:8.1-fpm
WORKDIR "/application"
ENV NODE_LTS=16

# Nodejs
RUN curl -sSL --fail https://deb.nodesource.com/setup_${NODE_LTS}.x | bash -

RUN apt-get update; \
    apt-get -y --no-install-recommends install \
        git \ 
        php8.1-intl \ 
        php8.1-mcrypt \ 
        php8.1-mysql \ 
        php8.1-pgsql \ 
        php8.1-xdebug \
        apt-utils \
        nodejs; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
