#!/bin/bash
set -ea

# Download stable release of xdebug 2.4.0
# su-exec wget -c "http://xdebug.org/files/xdebug-2.4.0.tgz"
# Extract archive
# su-exec tar -xf xdebug-2.4.0.tgz
# su-exec cd xdebug-2.4.0/

# build extension
# su-exec phpize
# su-exec ./configure
# su-exec make && su-exec make install

# install xdebug
su-exec apk --update --no-cache add build-base autoconf
su-exec pecl install -o -f xdebug
su-exec rm -rf /tmp/pear
su-exec docker-php-ext-enable xdebug
su-exec sed -i '1 a xdebug.remote_autostart=off' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
su-exec sed -i '1 a xdebug.remote_mode=req' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
su-exec sed -i '1 a xdebug.remote_handler=dbgp' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
su-exec sed -i '1 a xdebug.remote_connect_back=1 ' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
su-exec sed -i '1 a xdebug.remote_port=9000' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
su-exec sed -i '1 a xdebug.remote_host=127.0.0.1' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
su-exec sed -i '1 a xdebug.remote_enable=1' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
