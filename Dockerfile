## -*- docker-image-name: "armbuild/ocs-app-ghost:utopic" -*-
FROM armbuild/ocs-distrib-ubuntu:utopic
MAINTAINER Online Labs <opensource@ocs.online.net> (@online_en)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter

# Install packages
RUN apt-get -q update && \
    apt-get -q -y upgrade && \
    apt-get install -y -q \
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
RUN wget -qO ghost.zip https://ghost.org/zip/ghost-0.6.0.zip && \
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
