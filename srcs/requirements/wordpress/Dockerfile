FROM    debian:buster

RUN     apt-get update && \
        apt-get install -y  php-fpm php-mysql curl mariadb-client

RUN     sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/pool.d/www.conf && \
        echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

RUN     curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
        chmod +x wp-cli.phar && \
        mv wp-cli.phar  /usr/bin/wp

RUN     mkdir -p /var/www/html  /run/php && \
        wp core download --path=/var/www/html --allow-root

#COPY    site/static/.     /var/www/html/
#RUN     find /var/www/html -type f -exec chmod 644 {} \; -print
#RUN     find /var/www/html -type d -exec chmod 755 {} \; -print
#COPY    site/dynamic/info.php   /var/www/html/
#RUN     chmod +r /var/www/html/info.php
#COPY    site/dynamic/index.php  /var/www/html/appointments/
#RUN     chmod +r /var/www/html/appointments/index.php

COPY    start.sh     .
RUN     chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]     
