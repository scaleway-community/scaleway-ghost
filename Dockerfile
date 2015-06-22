## -*- docker-image-name: "armbuild/scw-app-ghost:utopic" -*-
FROM armbuild/scw-distrib-ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install packages
RUN apt-get -q update \
 && apt-get -q -y upgrade \
 && apt-get install -y -q \
        build-essential \
        nginx \
        supervisor \
        zip \
 && apt-get clean


# Install node from PPA
RUN curl -sL https://deb.nodesource.com/setup | sudo bash - && \
    apt-get -yq install nodejs && \
    apt-get clean


# Install ghost
ENV GHOST_VERSION 0.6.4
RUN wget -qO ghost.zip https://ghost.org/zip/ghost-${GHOST_VERSION}.zip && \
    rm -rf /var/www && \
    unzip ghost.zip -d /var/www/ && \
    rm -f ghost.zip && \
    cd /var/www && npm install --production


# Patches
ADD ./patches/ /


# Add ghost user
RUN useradd ghost && chown -R ghost:ghost /var/www


# Configures nginx
RUN ln -sf /etc/nginx/sites-available/ghost /etc/nginx/sites-enabled/ghost && \
    rm -f /etc/nginx/sites-enabled/default


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
